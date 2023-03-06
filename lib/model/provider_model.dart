import 'package:flutter_cubit/model/product_model.dart';

class ProviderModel {
  String name;
  int id;
  String location;
  int closingHours;
  List<ProductModel> products;

  ProviderModel({
    required this.id,
    required this.name,
    required this.location,
    required this.closingHours,
    required this.products,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["products"];
    List<ProductModel> products = list.map((e) => ProductModel.fromJson(e)).toList();

    return ProviderModel(
      id: json["id"],
      name: json["name"],
      location: json["location"],
      closingHours: json["closingHours"],
      products: products
    );
  }
}