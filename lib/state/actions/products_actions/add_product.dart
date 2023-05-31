import 'package:flutter_cubit/model/product_model.dart';

class AddProductToCart {
  final ProductModel _product;

  ProductModel get product => _product;

  AddProductToCart(this._product);
}