import 'package:dartz/dartz.dart';
import '../../../../data/features/presonalisation/models/user.dart';

abstract class UserRepository{
  Future<Either> save({required UserParams user});
}