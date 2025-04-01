import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){
   this.getCurrentUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// --- Get Current User
  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {

      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  /// --- Sign Out User
  void signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    emit(AuthUnauthenticated());
  }
}
