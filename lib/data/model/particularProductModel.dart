// To parse this JSON data, do
//
//     final particularProductModel = particularProductModelFromJson(jsonString);

import 'dart:convert';

ParticularProductModel particularProductModelFromJson(String str) => ParticularProductModel.fromJson(json.decode(str));

String particularProductModelToJson(ParticularProductModel data) => json.encode(data.toJson());

class ParticularProductModel {
    int id;
    String name;
    String price;
    String regularPrice;
    String salePrice;
    String description;
    String shortDescription;
    String sku;
    String stockStatus;
    String imageUrl;
    String permalink;

    ParticularProductModel({
        required this.id,
        required this.name,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.description,
        required this.shortDescription,
        required this.sku,
        required this.stockStatus,
        required this.imageUrl,
        required this.permalink,
    });

    factory ParticularProductModel.fromJson(Map<String, dynamic> json) => ParticularProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        stockStatus: json["stock_status"],
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
        "short_description": shortDescription,
        "sku": sku,
        "stock_status": stockStatus,
        "image_url": imageUrl,
        "permalink": permalink,
    };
}
