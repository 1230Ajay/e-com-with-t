part of 'signin_cubit.dart';

enum SignInStatus { INITIAL, SUCCESS, RESQUEST_SENT }

class SigninState {
  final String email;
  final String password;

  final SignInStatus signInStatus;

  final Map<String, dynamic> signInErrors;
  final bool showPassword;

  SigninState(
      {this.signInErrors = const {},
      this.email = '',
      this.password = '',
      this.signInStatus = SignInStatus.INITIAL,
      this.showPassword = false
      });

  SigninState copyWith(
      {String? email, String? password, SignInStatus? signInStatus,Map<String,dynamic>? signInErrors,bool? showPassword}) {
    return SigninState
      (
        email: email ?? this.email,
        password: password ?? this.password,
        signInStatus: signInStatus ?? this.signInStatus,
        signInErrors: signInErrors ?? this.signInErrors,
        showPassword: showPassword??this.showPassword
    );
  }

  @override
  List<Object?> get props => [email,password,signInStatus,signInErrors];
}
