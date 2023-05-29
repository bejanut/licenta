class ProductModel {
  String id;
  String name;
  String img;
  num oldPrice;
  num newPrice;
  String description;
  num quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.img,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["productId"],
      newPrice: json["newPrice"],
      oldPrice: json["oldPrice"],
      name: json["name"],
      description: json["description"],
      img: json["img"],
      quantity: int.tryParse(json["quantity"])!
    );
  }

  String getDiscount() {
    var percent = ((oldPrice - newPrice) * 100 / oldPrice).round();

    return percent.toString();
  }
}