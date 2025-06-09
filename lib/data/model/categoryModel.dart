// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    int id;
    String name;
    String slug;
    String description;
    int count;
    String? imageUrl;
    int parent;

    CategoryModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.count,
        required this.imageUrl,
        required this.parent,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        count: json["count"],
        imageUrl: json["image_url"],
        parent: json["parent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "count": count,
        "image_url": imageUrl,
        "parent": parent,
    };
}
