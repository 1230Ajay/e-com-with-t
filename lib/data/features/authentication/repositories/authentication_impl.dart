import 'package:dartz/dartz.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/data/features/authentication/models/email.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';
import 'package:tapp/service_locator.dart';
import '../../../../domain/features/authentication/repositories/authentication.dart';
import '../models/signup.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{

  @override
  Future<Either> signin({required SignInParams params}) async {
       return await ServiceLocator.instance.getIt<AuthenticationApiService>().signin(params: params);
  }

  @override
  Future<Either> signup({required SignUpParams params})async {
       return ServiceLocator.instance.getIt<AuthenticationApiService>().signup(params:params);
  }

  @override
  Future<Either> sendVerificationEmail() {
    return ServiceLocator.instance.getIt<AuthenticationApiService>().sendVerificationEmail();
  }

  @override
  Future<bool> emailVerificationStatus() {
    return ServiceLocator.instance.getIt<AuthenticationApiService>().emailVerificationStatus();
  }

  @override
  Future<Either> googleSignIn() async {
    return await ServiceLocator.instance.getIt<AuthenticationApiService>().googleSignIn();
  }

  @override
  Future<Either> sendResetPasswordEmail({required EmailParams params}) async {
    return await ServiceLocator.instance.getIt<AuthenticationApiService>().sendResetPasswordEmail(params:params);
  }

}