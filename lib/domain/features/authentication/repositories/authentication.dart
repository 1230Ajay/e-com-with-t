import 'package:dartz/dartz.dart';
import 'package:tapp/data/features/authentication/models/email.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';

import '../../../../data/features/authentication/models/signup.dart';

abstract class AuthenticationRepository{
  Future<Either> signin({ required SignInParams params});
  Future<Either> signup({required SignUpParams params});
  Future<Either> sendVerificationEmail();
  Future<bool> emailVerificationStatus();
  Future<Either> googleSignIn();
  Future<Either> sendResetPasswordEmail({required EmailParams params});
 }