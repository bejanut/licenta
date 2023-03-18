class ProductPreviewModel {
  String name;
  String imageLink;
  String description;
  String location;
  num oldPrice;
  num newPrice;
  num finishHour;
  num offersLeft;

  ProductPreviewModel({
    required this.name,
    required this.imageLink,
    required this.description,
    required this.location,
    required this.oldPrice,
    required this.newPrice,
    required this.finishHour,
    required this.offersLeft
  });

  factory ProductPreviewModel.fromJson(Map<String, dynamic> json) {
    return ProductPreviewModel(
        name: json["product_name"],
        imageLink: json["img_link"],
        description: json["description"],
        location: json["location"],
        oldPrice: json["old_price"],
        newPrice: json["new_price"],
        finishHour: json["finish_hour"],
        offersLeft: json["offers_left"]
    );
  }

  String getDiscount() {
    var percent = ((oldPrice - newPrice) * 100 / oldPrice).round();

    return percent.toString();
  }

  String getFinishHour() {
    var hour = finishHour / 100;
    var minute = finishHour % 100;

    return hour.toInt().toString() + ':' + minute.toString();
  }

}