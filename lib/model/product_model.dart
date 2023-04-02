class ProductModel {
  String name;
  String img;
  num oldPrice;
  num newPrice;
  String description;
  num quantity;

  ProductModel({
    required this.name,
    required this.img,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      img: json["img"],
      oldPrice: json["oldPrice"],
      newPrice: json["newPrice"],
      description: json["description"],
      quantity: json["left"]
    );
  }

  String getDiscount() {
    var percent = ((oldPrice - newPrice) * 100 / oldPrice).round();

    return percent.toString();
  }
}