class ProductModel {
  String name;
  String img;
  num oldPrice;
  num newPrice;
  String description;
  num left;

  ProductModel({
    required this.name,
    required this.img,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.left,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      img: json["img"],
      oldPrice: json["oldPrice"],
      newPrice: json["newPrice"],
      description: json["description"],
      left: json["left"]
    );
  }
}