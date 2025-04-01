import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/user.dart';

abstract class UserApiService {
  Future<Either> save({required UserParams params});
}

class UserApiServiceImpl extends UserApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either> save({required UserParams params}) async {
    try {
      // Save additional user details in Firestore
      await _firestore.collection('users').doc(params.uid).set(params.toMap());
      return Right("User Saved!");
    } on FirebaseException catch (e){
      return Left(e.message);
    }
    catch (e) {
      return Left("");
    }
  }
}
