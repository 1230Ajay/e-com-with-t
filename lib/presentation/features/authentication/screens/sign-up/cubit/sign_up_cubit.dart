import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/comman/widgets/popups/app_toast.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/data/features/authentication/models/signup.dart';
import 'package:tapp/domain/features/authentication/usecases/email_verification_status.dart';
import 'package:tapp/domain/features/authentication/usecases/send_email_verification.dart';
import 'package:tapp/domain/features/authentication/usecases/signup_usecase.dart';
import 'package:tapp/service_locator.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  Timer? _emailVerificationTimer; // Store timer reference

  void updateFirstName(String value) {
    emit(state.copyWith(firstName: value));
    // _updateField('firstName', value, _validateName(value));
  }



  void updateLastName(String value) {
    emit(state.copyWith(lastName: value));
    // _updateField('lastName', value, _validateName(value));
  }

  void updateUsername(String value) {
    emit(state.copyWith(username: value));
    // _updateField('username', value, _validateUsername(value));
  }

  void updateEmail(String value) {
    emit(state.copyWith(email: value));
    // _updateField('email', value, _validateEmail(value));
  }

  void updatePhoneNo(String value) {
    emit(state.copyWith(phoneNo: value));
    // _updateField('phoneNo', value, _validatePhoneNo(value));
  }

  void updatePassword(String value) {
    emit(state.copyWith(password: value));
    // _updateField('password', value, _validatePassword(value));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void updateAgreementStatus(bool? value) {
    emit(state.copyWith(
      agreedToTerms: value ?? false,
      validationErrors: {
        ...state.validationErrors,
        'agreedToTerms': value == true ? null : 'You must agree to terms',
      },
    ));
  }

  Future<Either> submitSignUpForm() async {
    final validationErrors = {
      'firstName': _validateName(state.firstName),
      'lastName': _validateName(state.lastName),
      'username': _validateUsername(state.username),
      'email': _validateEmail(state.email),
      'phoneNo': _validatePhoneNo(state.phoneNo),
      'password': _validatePassword(state.password),
    };

    final isFormValid = validationErrors.values.every((error) => error == null);

    emit(state.copyWith(validationErrors: validationErrors, isFormValid: isFormValid));

    if(!state.agreedToTerms && isFormValid){
      AppToast.showToast("You must agreed to TNC Policies",type: ToastType.warning);
      emit(state.copyWith(signUpFormState: SignUpFormState.INITIAL));
      return Left("user not agreed to policies");
    }

    if (isFormValid) {
     return await _submitForm();
    }else{
      return Left("Please fill form Correctly");
    }
  }


  Future<Either> _submitForm() async {
    emit(state.copyWith(signUpFormState: SignUpFormState.SUBMITTING));
    final res = await ServiceLocator.instance.getIt<SignupUsecase>().call(
      params: SignUpParams(
        email: state.email,
        password: state.password,
        firstName: state.firstName,
        lastName: state.lastName,
        phoneNumber: state.phoneNo,
      ),
    );

    return res.fold(
      (e){
        AppToast.showToast(e);
        emit(state.copyWith(signUpFormState: SignUpFormState.INITIAL));
        return Left(e);
      }, // Handle error case
          (userCredential) {
            AppToast.showToast("User has created succesfully",type: ToastType.success);
           return Right(userCredential);
          }, // Handle success case
    );
  }


  Future<void> sendEmailVerificationEmail() async {
   final res = await ServiceLocator.instance.getIt<SendEmailVerificationUseCase>().call(params: null);
   res.fold(
           (e){
             AppToast.showToast(e);
           },
         (_) {
       emit(state.copyWith(
         emailVerificationState: EmailVerificationState.EMAIL_SENT,
         emailVerificationTimeout: 60, // Reset timeout when email is sent
       ));

       // Cancel the previous timer if it exists
       _emailVerificationTimer?.cancel();

       // Start a new timer
       _emailVerificationTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
         if (state.emailVerificationTimeout == 0) {
           emit(state.copyWith(emailVerificationState: EmailVerificationState.TIMEOUT));
           timer.cancel();
         } else {
             emit(state.copyWith(emailVerificationTimeout: state.emailVerificationTimeout - 1));

           bool isEmailVerified =  await ServiceLocator.instance.getIt<EmailVerificationStatusUseCase>().call(params: null);
           if(isEmailVerified){
             _emailVerificationTimer?.cancel();
             emit(state.copyWith(emailVerificationState: EmailVerificationState.SUCCESS));
           }
         }
       });
     },
   );
  }
  // void _updateField(String field, String value, String? error) {
  //   final newValidationErrors = {...state.validationErrors, field: error};
  //   emit(state.copyWith(validationErrors: newValidationErrors, isFormValid: _isFormValid(newValidationErrors)));
  // }

  // bool _isFormValid(Map<String, String?> errors) {
  //   return errors.values.every((error) => error == null);
  // }

  String? _validateName(String value) => value.isNotEmpty ? null : "Name cannot be empty";
  String? _validateUsername(String value) => value.length >= 4 ? null : "Username must be at least 4 characters";
  String? _validateEmail(String value) => value.contains('@') & value.contains("gmail.com") ? null : "Enter a valid email";
  String? _validatePhoneNo(String value) => value.length >= 10 ? null : "Phone number must be at least 10 digits";
  String? _validatePassword(String value) => value.length >= 6 ? null : "Password must be at least 6 characters";

  @override
  Future<void> close() {
    _emailVerificationTimer?.cancel(); // Ensure timer is canceled when Cubit is closed
    return super.close();
  }

}
