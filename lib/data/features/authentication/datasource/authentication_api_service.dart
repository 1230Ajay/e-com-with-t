import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tapp/data/features/authentication/models/email.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';
import 'package:tapp/service_locator.dart';
import '../../presonalisation/datasource/user_api_service.dart';
import '../../presonalisation/models/user.dart';
import '../models/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationApiService {
  Future<Either> signin({required SignInParams params});

  Future<Either> signup({required SignUpParams params});

  Future<Either> logout();

  Future<Either> sendVerificationEmail();

  Future<bool> emailVerificationStatus();

  Future<Either> googleSignIn();

  Future<Either> sendResetPasswordEmail({required EmailParams params});
}

class AuthenticationApiServiceImpl extends AuthenticationApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either> signin({required SignInParams params}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: params.username, password: params.password);
      return await Right("Login Successfull");
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left("An unknown error found");
    }
  }

  Future<Either<String, UserCredential>> googleSignIn() async {
    try {
      // Trigger Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left("Google sign-in was canceled");
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        return Left("Google sign-in failed");
      }

      // Save user details to Firestore
      final result = await ServiceLocator.instance.getIt<UserApiService>().save(
            params: UserParams(
              uid: user.uid,
              email: user.email!,
              firstName: user.displayName ?? "Unknown",
              lastName: "",
              phoneNumber: user.phoneNumber ?? "",
              photoURL: user.photoURL,
            ),
          );

      if (result.isLeft()) {
        return Left("Failed to save user data");
      }

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Authentication error: ${e.code}");
    } on FirebaseException catch (e) {
      return Left(e.message ?? "Firebase error occurred");
    } catch (e) {
      return Left("Unknown error occurred: $e");
    }
  }

  Future<Either<String, UserCredential>> signup(
      {required SignUpParams params}) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      if (params.photoURL != null) {
        await userCredential.user?.updatePhotoURL(params.photoURL);
      }

      // Update Firebase Auth user profile
      await userCredential.user?.updateDisplayName(params.firstName);
      final result = await ServiceLocator.instance.getIt<UserApiService>().save(
          params: UserParams(
              uid: userCredential.user?.uid,
              email: params.email,
              lastName: params.lastName,
              firstName: params.firstName,
              phoneNumber: params.phoneNumber));

      await userCredential.user?.reload();

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(
          e.message ?? "An Authentication error occured with code ${e.code}");
    } on FirebaseException catch (e) {
      return Left(e.message ?? "An Firebase Exception occured");
    } catch (e) {
      return Left("Somthing went unknown error");
    }
  }

  Future<Either> logout() async {
    try {
      await _auth.signOut();
      return Right(null); // Success case
    } catch (e) {
      return Left(e.toString()); // Error case
    }
  }

  @override
  Future<Either> sendVerificationEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return Right("Email sent to your registered email");
    } on FirebaseAuthException catch (e) {
      return Left(
          e.message ?? "An Authentication error occured with code ${e.code}");
    } on FirebaseException catch (e) {
      return Left(e.message ?? "An Firebase Exception occured");
    } catch (e) {
      return Left("Somthing went unknown error");
    }
  }

  @override
  Future<bool> emailVerificationStatus() async {
    await _auth.currentUser?.reload();
    final user = _auth.currentUser;
    return user != null && user.emailVerified;
  }

  @override
  Future<Either> sendResetPasswordEmail({required EmailParams params}) async {
    try {
      await _auth.sendPasswordResetEmail(email: params.email);
      return Right("Email sent to you registered email!");
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return await Left("Something went wrong while sending reset password email");
    }
  }
}
