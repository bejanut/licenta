import 'package:flutter_cubit/model/product_model.dart';
import 'package:flutter_cubit/model/provider_model.dart';

class OpenProductPageAction {
  final ProductModel _selectedProduct;
  final ProviderModel _selectedProvider;

  ProductModel get selectedProduct => _selectedProduct;
  ProviderModel get selectedProvider => _selectedProvider;

  OpenProductPageAction(this._selectedProduct, this._selectedProvider);
}