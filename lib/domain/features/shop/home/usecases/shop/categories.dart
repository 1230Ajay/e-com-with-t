import 'package:dartz/dartz.dart';
import 'package:tapp/core/usecases/usecases.dart';
import 'package:tapp/data/features/shop/home/datasource/categorie_api_service.dart';
import 'package:tapp/data/features/shop/home/model/category.dart';
import 'package:tapp/service_locator.dart';

import '../../repositories/categories.dart';

class GetCategoriesUseCase extends UseCases<Either,dynamic>{
  @override
  Future<Either> call({required params}) {
    return ServiceLocator.instance.getIt<CategoriesRepository>().get();
  }
}

class UploadCategoriesUseCase extends UseCases<Either,dynamic>{
  @override
  Future<Either> call({required params}) async {
      return await ServiceLocator.instance.getIt<CategoriesRepository>().upload();
  }
}