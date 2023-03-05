import 'package:flutter_cubit/model/product_model.dart';

class ProviderModel {
  String name;
  String location;
  int closingHours;
  List<ProductModel> products;

  ProviderModel({
    required this.name,
    required this.location,
    required this.closingHours,
    required this.products,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["products"];
    List<ProductModel> products = list.map((e) => ProductModel.fromJson(e)).toList();

    return ProviderModel(
      name: json["name"],
      location: json["location"],
      closingHours: json["closingHours"],
      products: products
    );
  }
}