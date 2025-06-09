// To parse this JSON data, do
//
//     final productsByCategory = productsByCategoryFromJson(jsonString);

import 'dart:convert';

List<ProductsByCategory> productsByCategoryFromJson(String str) => List<ProductsByCategory>.from(json.decode(str).map((x) => ProductsByCategory.fromJson(x)));

String productsByCategoryToJson(List<ProductsByCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsByCategory {
    int id;
    String name;
    String price;
    String regularPrice;
    String salePrice;
    String image;
    String permalink;

    ProductsByCategory({
        required this.id,
        required this.name,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.image,
        required this.permalink,
    });

    factory ProductsByCategory.fromJson(Map<String, dynamic> json) => ProductsByCategory(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        image: json["image"],
        permalink: json["permalink"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "image": image,
        "permalink": permalink,
    };
}
