import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/model/product_model.dart';
import 'package:flutter_cubit/state/actions/products_actions/add_product.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_cubit/widgets/stateless/app_text.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:map_launcher/map_launcher.dart';

import '../misc/colors.dart';
import '../model/provider_model.dart';
import '../services/map_loader.dart';
import '../state/AppState.dart';
import '../state/actions/products_actions/change-page.dart';
import '../state/actions/products_actions/thunk-go-home.dart';
import '../widgets/stateless/simple_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class DetailState {
  ProductModel product;
  ProviderModel provider;

  DetailState(this.product, this.provider);
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailState>(
        converter: (store) => DetailState(
            store.state.productsState.selectedProduct!,
            store.state.productsState.selectedProvider!
        ),
        builder: (_, details) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:  NetworkImage(details.product.img),
                          fit: BoxFit.cover
                      ),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 70,
                  right: 20,
                  child: Row(
                    children: [
                      StoreConnector<AppState, DispatchFunc>(
                        converter: (store) => () => store.dispatch(goHome),
                        builder: (_, goHome) {
                          return IconButton(
                            onPressed: goHome, icon: Icon(Icons.arrow_back_ios), color: Colors.white);
                        }
                      ),
                      Expanded(child: Container()),
                      StoreConnector<AppState, DispatchFunc>(
                        converter: (store) => () => store.dispatch(ChangePageAction(PageTypes.cartPage)),
                        builder: (_, goToCart) {
                          return IconButton(onPressed: goToCart, icon: Icon(Icons.shopping_cart, size: 30), color: Colors.white);
                        }
                      ),
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 550,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: details.product.name, color: Colors.black.withOpacity(0.8)),
                        SizedBox(height: 5),
                        Row(
                            children: [
                              Text(
                                details.product.oldPrice.toStringAsFixed(2),
                                style: TextStyle(
                                    color: Colors.red.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                details.product.newPrice.toStringAsFixed(2) + ' LEI',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => MapLoader.openMaps(
                              context,
                              details.provider.name,
                              new Coords(details.provider.lat.toDouble(), details.provider.lon.toDouble())),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: AppColors.mainColor),
                              SizedBox(width: 5),
                              AppText(text: details.provider.address, color: AppColors.textColor1)
                            ],),
                        ),
                        SizedBox(height: 25),
                        AppLargeText(text: "Availability", color: Colors.black.withOpacity(0.8), size: 20),
                        SizedBox(height: 10),
                        Column (
                            children: [
                              // Offer End Time
                              Row (
                                  children: [
                                    Icon(Icons.access_time, size: 16, color: AppColors.mainTextColor),
                                    SizedBox(width: 5),
                                    Text(
                                      'Ends at: ' + details.provider.getFinishHour(),
                                      style: TextStyle(
                                        color: AppColors.mainTextColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                              SizedBox(height: 5),
                              // Number of offers remaining
                              Row (
                                  children: [
                                    Icon(Icons.fastfood_rounded, size: 16, color: AppColors.mainTextColor),
                                    SizedBox(width: 5),
                                    Text(
                                      'Offers left: ' + details.product.quantity.toString(),
                                      style: TextStyle(
                                        color: AppColors.mainTextColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                        ),
                        SizedBox(height: 40),
                        AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 20),
                        SizedBox(height: 10),
                        AppText(text: details.product.description, color: AppColors.mainTextColor),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: StoreConnector<AppState, void Function(ProductModel product)>(
                  converter: (store) => (product) => store.dispatch(AddProductToCart(product)),
                  builder: (_, addProduct) {
                    return StoreConnector<AppState, int>(
                      converter: (store) => store.state.productsState.selectedQuantities[details.product.id] ?? 0,
                      builder: (_, cartQuantity) {
                        const successSnackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                          margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                          content: Text('Product added to cart', textAlign: TextAlign.center),
                        );

                        const maxCapacitySnackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                          margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                          content: Text('All available products were added to the cart', textAlign: TextAlign.center),
                        );

                        void showSnackBarMessage (bool success) {
                          SnackBar snackBar = success
                              ? successSnackBar
                              : maxCapacitySnackBar;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return Container(
                          child: SimpleRoundedButton(
                            fontSize: 18,
                            text: 'Add to cart',
                            onPressed: () => {
                              if (cartQuantity < details.product.quantity) {
                                addProduct(details.product),
                                showSnackBarMessage(true)
                              } else {
                                showSnackBarMessage(false)
                              }
                            },
                            height: 50,
                          ),
                    );
                  });
                })
              )
            ],
          ),
        ),
      );
    });
  }
}
