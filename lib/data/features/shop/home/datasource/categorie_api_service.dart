import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart' as path;
import 'package:tapp/data/features/shop/home/model/category.dart';
import '../../../../../core/utils/constants/images.dart';

abstract class CategoriesApiService {
  Future<Either<String, List<CategoryModel>>> get();
  Future<Either<String, List<String>>> upload();
}

class CategoriesApiServiceImpl extends CategoriesApiService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<Either<String, List<CategoryModel>>> get() async {
    try {
      final QuerySnapshot querySnapshot = await _db.collection("categories").get();
      List<CategoryModel> data = querySnapshot.docs.map((doc) {
        final docData = doc.data() as Map<String, dynamic>;
        return CategoryModel.fromSnapshot(docData);
      }).toList();
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(e.message ?? 'Firebase error occurred');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<String>>> upload() async {
    try {
      print("........................... Upload Categories");

      final List<CategoryModel> categories = [
        CategoryModel(image: TImages.sportIcon, isFeatured: true, name: "Sports", parentId: "1"),
        CategoryModel(image: TImages.clothIcon, isFeatured: true, name: "Clothing", parentId: "1"),
        CategoryModel(image: TImages.shoeIcon, isFeatured: true, name: "Shoes", parentId: "2"),
        CategoryModel(image: TImages.cosmeticsIcon, isFeatured: true, name: "Cosmetics", parentId: "2"),
        CategoryModel(image: TImages.animalIcon, isFeatured: true, name: "Pets", parentId: "1"),
        CategoryModel(image: TImages.toyIcon, isFeatured: true, name: "Toys", parentId: "1"),
        CategoryModel(image: TImages.furnitureIcon, isFeatured: true, name: "Furniture", parentId: "1"),
        CategoryModel(image: TImages.jeweleryIcon, isFeatured: true, name: "Jewelry", parentId: "1"),
        CategoryModel(image: TImages.electronicsIcon, isFeatured: true, name: "Electronics", parentId: "1"),
      ];

      final List<String> uploadedIds = [];
      final batch = _db.batch();

      for (final category in categories) {
        try {
          final docRef = _db.collection("categories").doc();
          batch.set(docRef, {
            'name': category.name,
            'isFeatured': category.isFeatured,
            'image': category.image, // Directly storing the asset path
            'createdAt': FieldValue.serverTimestamp(),
          });
          uploadedIds.add(docRef.id);
        } catch (e) {
          print("Error uploading category ${category.name}: $e");
          continue;
        }
      }

      if (uploadedIds.isEmpty) {
        return Left('Failed to upload any categories');
      }
      await batch.commit();
      return Right(uploadedIds);
    } on FirebaseException catch (e) {
      return Left('Firebase error: ${e.message}');
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

}
