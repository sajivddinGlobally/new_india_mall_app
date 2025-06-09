// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    String status;
    List<Order> orders;

    OrderModel({
        required this.status,
        required this.orders,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class Order {
    int orderId;
    String status;
    String total;
    String currency;
    DateTime dateCreated;
    Map<String, Item> items;

    Order({
        required this.orderId,
        required this.status,
        required this.total,
        required this.currency,
        required this.dateCreated,
        required this.items,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        status: json["status"],
        total: json["total"],
        currency: json["currency"],
        dateCreated: DateTime.parse(json["date_created"]),
        items: Map.from(json["items"]).map((k, v) => MapEntry<String, Item>(k, Item.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "status": status,
        "total": total,
        "currency": currency,
        "date_created": dateCreated.toIso8601String(),
        "items": Map.from(items).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Item {
    int productId;
    String productName;
    int quantity;
    String total;

    Item({
        required this.productId,
        required this.productName,
        required this.quantity,
        required this.total,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        productName: json["product_name"],
        quantity: json["quantity"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "quantity": quantity,
        "total": total,
    };
}
