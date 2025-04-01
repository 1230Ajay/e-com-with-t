import 'package:dartz/dartz.dart';
import 'package:tapp/core/usecases/usecases.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/domain/features/authentication/repositories/authentication.dart';
import 'package:tapp/service_locator.dart';

class GoogleSignInUseCase extends UseCases<Either,dynamic>{
  @override
  Future<Either> call({required params}) {
    return ServiceLocator.instance.getIt<AuthenticationRepository>().googleSignIn();
  }

}