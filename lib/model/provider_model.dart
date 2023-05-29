import 'package:flutter_cubit/model/product_model.dart';

class ProviderModel {
  String name;
  int id;
  String address;
  num lat;
  num lon;
  int closingHours;
  List<ProductModel> products;
  bool isFavourite;

  ProviderModel({
    required this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.closingHours,
    required this.isFavourite,
    required this.products,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["products"];
    List<ProductModel> products = list.map((e) => ProductModel.fromJson(e)).toList();

    return ProviderModel(
      id: json["id"],
      name: json["name"],
      lat: json["lat"],
      lon: json["lon"],
      address: json["address"],
      closingHours: json["closeHour"],
      isFavourite: json["isFavourite"] == 'true',
      products: products,
    );
  }

  String getFinishHour() {
    var hour = closingHours / 100;
    var minute = closingHours % 100;

    return hour.toInt().toString() + ':' + minute.toString();
  }
}