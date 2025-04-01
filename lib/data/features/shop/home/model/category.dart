import 'package:cloud_firestore/cloud_firestore.dart';
class CategoryModel {
  final String? id;
  final String? parentId;
  final String image;
  final bool isFeatured;
  final String name;

  CategoryModel({
    this.id,
    this.parentId,
    required this.image,
    required this.isFeatured,
    required this.name,
  });

  factory CategoryModel.fromSnapshot(
      Map<String, dynamic> snapshot,
      ) {

    return CategoryModel(
      id: snapshot["Id"],
      parentId: snapshot['ParentId']?.toString(),
      image: snapshot['image'] ?? '',
      isFeatured: snapshot['isFeatured'] ?? false,
      name: snapshot['name'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ParentId': parentId,
      'Image': image,
      'IsFeatured': isFeatured,
      'Name': name,
    };
  }

}