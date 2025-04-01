import 'package:dartz/dartz.dart';
import 'package:tapp/core/usecases/usecases.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';
import 'package:tapp/domain/features/authentication/repositories/authentication.dart';
import 'package:tapp/service_locator.dart';

class SignInUsecase extends UseCases<Either,SignInParams>{
  @override
  Future<Either> call({required SignInParams params}) async {
    return ServiceLocator.instance.getIt<AuthenticationRepository>().signin(params: params);
  }

}