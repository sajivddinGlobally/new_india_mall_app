// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    String status;
    Addresses addresses;

    AddressModel({
        required this.status,
        required this.addresses,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        addresses: Addresses.fromJson(json["addresses"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "addresses": addresses.toJson(),
    };
}

class Addresses {
    Address683B202Aedfcb801257173 address683B202Aedfcb801257173;

    Addresses({
        required this.address683B202Aedfcb801257173,
    });

    factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        address683B202Aedfcb801257173: Address683B202Aedfcb801257173.fromJson(json["address_683b202aedfcb8.01257173"]),
    );

    Map<String, dynamic> toJson() => {
        "address_683b202aedfcb8.01257173": address683B202Aedfcb801257173.toJson(),
    };
}

class Address683B202Aedfcb801257173 {
    String addressLine;
    String city;
    String state;
    String zipcode;
    String country;
    bool isDefault;

    Address683B202Aedfcb801257173({
        required this.addressLine,
        required this.city,
        required this.state,
        required this.zipcode,
        required this.country,
        required this.isDefault,
    });

    factory Address683B202Aedfcb801257173.fromJson(Map<String, dynamic> json) => Address683B202Aedfcb801257173(
        addressLine: json["address_line"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
        isDefault: json["is_default"],
    );

    Map<String, dynamic> toJson() => {
        "address_line": addressLine,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "is_default": isDefault,
    };
}
