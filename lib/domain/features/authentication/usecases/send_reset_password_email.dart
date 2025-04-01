import 'package:dartz/dartz.dart';
import 'package:tapp/core/usecases/usecases.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/data/features/authentication/models/email.dart';
import 'package:tapp/domain/features/authentication/repositories/authentication.dart';
import 'package:tapp/service_locator.dart';

class SendResetPasswordEmailUseCase extends UseCases<Either,EmailParams>{
  @override
  Future<Either> call({required EmailParams params}) async {
    return await ServiceLocator.instance.getIt<AuthenticationRepository>().sendResetPasswordEmail(params: params);
  }

}