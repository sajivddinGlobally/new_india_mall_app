// To parse this JSON data, do
//
//     final getAllProductsModel = getAllProductsModelFromJson(jsonString);

import 'dart:convert';

List<GetAllProductsModel> getAllProductsModelFromJson(String str) => List<GetAllProductsModel>.from(json.decode(str).map((x) => GetAllProductsModel.fromJson(x)));

String getAllProductsModelToJson(List<GetAllProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllProductsModel {
    int id;
    String name;
    String price;
    String regularPrice;
    String salePrice;
    String description;
    String sku;
    String imageUrl;
    String permalink;

    GetAllProductsModel({
        required this.id,
        required this.name,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.description,
        required this.sku,
        required this.imageUrl,
        required this.permalink,
    });

    factory GetAllProductsModel.fromJson(Map<String, dynamic> json) => GetAllProductsModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        description: json["description"],
        sku: json["sku"],
        imageUrl: json["image_url"],
        permalink: json["permalink"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "description": description,
        "sku": sku,
        "image_url": imageUrl,
        "permalink": permalink,
    };
}
