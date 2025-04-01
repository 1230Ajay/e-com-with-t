
import 'package:dartz/dartz.dart';

abstract class CategoriesRepository{
  Future<Either> get();
  Future<Either> upload();
}