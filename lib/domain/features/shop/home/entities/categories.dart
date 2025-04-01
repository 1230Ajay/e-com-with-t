import 'package:cloud_firestore/cloud_firestore.dart';
class CategoryEntity {
  final String? id;
  final String? parentId;
  final String image;
  final bool isFeatured;
  final String name;

  CategoryEntity({
    this.id,
    this.parentId,
    required this.image,
    required this.isFeatured,
    required this.name,
  });

  factory CategoryEntity.fromSnapshot(
  Map<String, dynamic> snapshot,
      ) {
    return CategoryEntity(
      id: snapshot["Id"],
      parentId: snapshot['ParentId']?.toString(),
      image: snapshot['Image'] ?? '',
      isFeatured: snapshot['IsFeatured'] ?? false,
      name: snapshot['Name'] ?? '',
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