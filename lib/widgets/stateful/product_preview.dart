import 'package:flutter/material.dart';
import 'package:flutter_cubit/model/product_model.dart';
import 'package:flutter_cubit/model/provider_model.dart';

class ProductPreview extends StatelessWidget {
  final ProductModel product;
  final ProviderModel provider;
  const ProductPreview({required this.product, required this.provider, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child:
          Container(
            width: 350,
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(product.img),
                    fit: BoxFit.cover)),
          ),
        ),
        // Top left
        Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: 200,
              child: Text(
                product.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        //Top right
        Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 60,
              height: 30,
              decoration :BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '-' + product.getDiscount() + '%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
        //Bottom right
        Positioned(
            right: 10,
            bottom: 20,
            // Add clickable price
            child: Container(
              height: 40,
              decoration :BoxDecoration(
                color: Colors.cyan.shade500.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container (
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Center (
                  child: Row(
                      children: [
                        Text(
                          product.oldPrice.toStringAsFixed(2),
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          product.newPrice.toStringAsFixed(2) + ' LEI',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            )),
        // Bottom left
        Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              width: 100,
              child: Container (
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Center (
                  child: Column (
                      children: [
                        // Offer End Time
                        Row (
                            children: [
                              Icon(Icons.access_time, size: 16, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                provider.getFinishHour(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                        SizedBox(height: 10),
                        // Number of offers remaining
                        Row (
                            children: [
                              Icon(Icons.fastfood_rounded, size: 16, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                product.quantity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                      ]
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
