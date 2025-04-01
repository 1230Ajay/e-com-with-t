import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:tapp/comman/widgets/popups/app_toast.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';
import 'package:tapp/domain/features/authentication/usecases/signin_usecase.dart';
import 'package:tapp/service_locator.dart';

import '../../../../../../domain/features/authentication/usecases/google_signin.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());

  void updateEmail(String value){
    print(value);
    emit(state.copyWith(email: value));
  }
  void updatePassword(String value){
    emit(state.copyWith(password: value));
  }

  Future<void> updateShowPassword()async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
  Future<Either> signIn() async {

    Map<String,dynamic> signInError = {
      "email":_validateEmail(state.email),
      "password":_validatePassword(state.password)
    };

    final isFormValid = signInError.values.every((error) => error == null);

    emit(state.copyWith(signInErrors: signInError));

    if(isFormValid){


      emit(state.copyWith(signInStatus: SignInStatus.RESQUEST_SENT));
      final res = await  ServiceLocator.instance.getIt<AuthenticationApiService>().signin(params: SignInParams(username: state.email, password: state.password));

      return res.fold((e){
        emit(state.copyWith(signInStatus: SignInStatus.INITIAL));
        AppToast.showToast(e);
        return Left("");
      }, (_){
        AppToast.showToast("Logged in successful!");
        emit(state.copyWith(signInStatus: SignInStatus.SUCCESS));
        return Right("");
      });
    }
    emit(state.copyWith(signInStatus: SignInStatus.INITIAL));
    return Left("Form is invalid");
  }

  String? _validateEmail(String value) => value.contains('@') & value.contains("gmail.com") ? null : "Enter a valid email";
  String? _validatePassword(String value) => value.length >= 6 ? null : "Password must be at least 6 characters";

  Future<void> googleSignIn()async {
    emit(state.copyWith(signInStatus: SignInStatus.RESQUEST_SENT));
    final res = await ServiceLocator.instance.getIt<GoogleSignInUseCase>().call(params: null);
    res.fold((e){
      emit(state.copyWith(signInStatus: SignInStatus.INITIAL));
      AppToast.showToast(e);
      print(e+"-----------------------------------------------");
      return Left("");
    }, (_){
      AppToast.showToast("Logged in successful!");
      emit(state.copyWith(signInStatus: SignInStatus.SUCCESS));
      return Right("");
    });
  }

}
