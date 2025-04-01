import 'package:dartz/dartz.dart';
import 'package:tapp/core/usecases/usecases.dart';
import 'package:tapp/data/features/authentication/models/signup.dart';
import 'package:tapp/domain/features/authentication/repositories/authentication.dart';
import 'package:tapp/service_locator.dart';

class SignupUsecase extends UseCases<Either,SignUpParams>{
  @override
  Future<Either> call({required SignUpParams params}) async {
    return await ServiceLocator.instance.getIt<AuthenticationRepository>().signup(params: params);
  }

}