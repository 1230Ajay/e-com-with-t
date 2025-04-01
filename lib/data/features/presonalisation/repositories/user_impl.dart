import 'package:dartz/dartz.dart';
import 'package:tapp/data/features/presonalisation/datasource/user_api_service.dart';
import 'package:tapp/service_locator.dart';


import '../../../../domain/features/personalisation/repositories/user.dart';
import '../models/user.dart';

class UserRepositoryImpl extends UserRepository{
  @override
  Future<Either> save({required UserParams user}) async {
    return await ServiceLocator.instance.getIt<UserApiService>().save(params: user);
  }

}