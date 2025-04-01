part of 'forgot_password_cubit.dart';


enum ForgotPasswordEmailStatus{
  INITIAL,
  SENDING,
  SENT
}

class ForgotPasswordState {
  final String email;
  final Map<String,dynamic>  forgotPasswordErrors;

  final ForgotPasswordEmailStatus forgotPasswordEmailStatus;



  ForgotPasswordState({ this.email ='',  this.forgotPasswordErrors=const {}, this.forgotPasswordEmailStatus =  ForgotPasswordEmailStatus.INITIAL});

  ForgotPasswordState copyWith({String? email,Map<String,dynamic>? forgotPasswordErrors ,ForgotPasswordEmailStatus? forgotPasswordEmailStatus,bool? showPassword}){
    return ForgotPasswordState(
      email: email??this.email,
      forgotPasswordErrors: forgotPasswordErrors??this.forgotPasswordErrors,
      forgotPasswordEmailStatus: forgotPasswordEmailStatus??this.forgotPasswordEmailStatus,
    );
  }

  @override
  List<Object?> get props => [email,forgotPasswordErrors,forgotPasswordEmailStatus];

}