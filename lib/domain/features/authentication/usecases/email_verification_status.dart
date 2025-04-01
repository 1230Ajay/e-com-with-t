import 'package:tapp/core/usecases/usecases.dart';

import '../../../../service_locator.dart';
import '../repositories/authentication.dart';

class EmailVerificationStatusUseCase  extends UseCases<bool,dynamic> {
  @override
  Future<bool> call({required dynamic params}) async {
    return await ServiceLocator.instance.getIt<AuthenticationRepository>().emailVerificationStatus();
  }

}