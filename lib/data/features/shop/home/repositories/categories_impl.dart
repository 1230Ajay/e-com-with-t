import 'package:dartz/dartz.dart';
import 'package:tapp/service_locator.dart';

import '../../../../../domain/features/shop/home/repositories/categories.dart';
import '../datasource/categorie_api_service.dart';

class CategoriesReposiotyImpl extends CategoriesRepository{
  @override
  Future<Either> get() async {
    return await ServiceLocator.instance.getIt<CategoriesApiService>().get();
  }

  @override
  Future<Either> upload() async {
    return await ServiceLocator.instance.getIt<CategoriesApiService>().upload();
  }

}