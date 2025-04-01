import 'package:equatable/equatable.dart';

enum EmailVerificationState {
  INITIAL,
  EMAIL_SENT,
  TIMEOUT,
  SUCCESS
}

enum SignUpFormState {
  INITIAL,
  SUBMITTING,
  SUCCESS
}

class SignUpState extends Equatable {

  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNo;
  final String password;
  final bool showPassword;
  final bool agreedToTerms;
  final bool isFormValid;
  final Map<String, String?> validationErrors;
  final SignUpFormState signUpFormState;

  final EmailVerificationState emailVerificationState;

  final int emailVerificationTimeout;

  const SignUpState(
      {
        this.emailVerificationTimeout = 60,
        this.emailVerificationState = EmailVerificationState.INITIAL,
      this.firstName = '',
      this.lastName = '',
      this.username = '',
      this.email = '',
      this.phoneNo = '',
      this.password = '',
      this.showPassword = false,
      this.agreedToTerms = false,
      this.isFormValid = false,
      this.validationErrors = const {},
      this.signUpFormState = SignUpFormState.INITIAL,

      });

  SignUpState copyWith(
      {
        String? loggedInUserEmail,
        String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? phoneNo,
      String? password,
      bool? showPassword,
      bool? agreedToTerms,
      bool? isFormValid,
      Map<String, String?>? validationErrors,
      SignUpFormState? signUpFormState,
      EmailVerificationState? emailVerificationState,
        int? emailVerificationTimeout
      }) {
    return SignUpState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        password: password ?? this.password,
        showPassword: showPassword ?? this.showPassword,
        agreedToTerms: agreedToTerms ?? this.agreedToTerms,
        isFormValid: isFormValid ?? this.isFormValid,
        validationErrors: validationErrors ?? this.validationErrors,
        signUpFormState: signUpFormState ?? this.signUpFormState,
        emailVerificationState: emailVerificationState??this.emailVerificationState,
        emailVerificationTimeout: emailVerificationTimeout??this.emailVerificationTimeout
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        username,
        email,
        phoneNo,
        password,
        showPassword,
        agreedToTerms,
        isFormValid,
        validationErrors,
        signUpFormState,
        emailVerificationState,
        emailVerificationTimeout
      ];
}
