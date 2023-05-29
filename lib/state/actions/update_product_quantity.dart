class UpdateProductQuantity {
  final int _quantity;
  final String _productId;

  int get quantity => _quantity;
  String get productId => _productId;

  UpdateProductQuantity(this._quantity, this._productId);
}