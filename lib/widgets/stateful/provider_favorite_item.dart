import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/widgets/stateful/product_preview.dart';
import 'package:flutter_cubit/widgets/stateful/toggle_button.dart';

import '../../cubit/app_cubits.dart';
import '../../model/product_preview_model.dart';
import '../stateless/moving_text.dart';

class ProviderFavouriteItem extends StatefulWidget {
  final ProviderModel provider;
  final void Function(ProviderModel provider) removeItem;

  const ProviderFavouriteItem({
    required this.removeItem,
    required this.provider,
    Key? key
  }) : super(key: key);

  @override
  _ProviderFavouriteItemState createState() => _ProviderFavouriteItemState();
}

class _ProviderFavouriteItemState extends State<ProviderFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final ProviderModel provider = widget.provider;

    return Container(
      margin: const EdgeInsets.only(bottom: 25,),
      child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () => {print('Clicked Provider')},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  height: 50,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 30),
                        child: MovingText(
                          text: provider.name,
                          maxLength: 20,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () => {
                            BlocProvider.of<AppCubits>(context).removeFavouriteProvider(provider),
                            widget.removeItem(provider),
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.delete_outline, size: 30, color: Colors.black)
                          )
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, size: 30, color: Colors.black54),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              width: double.maxFinite,
              child: PageView.builder(
                itemCount: provider.products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final currentProduct = provider.products[index];
                  final product = ProductPreviewModel(
                      name: currentProduct.name,
                      imageLink: currentProduct.img,
                      oldPrice: currentProduct.oldPrice,
                      newPrice: currentProduct.newPrice,
                      finishHour: provider.closingHours,
                      offersLeft: currentProduct.left,
                      description: currentProduct.description,//provider.products[index].description,
                      location: provider.location
                  );

                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).detailPage(product);
                      },
                      child: Container (
                        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                        width: 300,
                        height: 200,
                        child: ProductPreview(productModel: product),
                      )
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}