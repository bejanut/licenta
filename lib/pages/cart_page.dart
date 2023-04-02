import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../misc/colors.dart';
import '../model/product_model.dart';
import '../state/AppState.dart';
import '../state/actions/thunk-go-home.dart';
import '../widgets/stateless/app_buttons.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
               Container(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    children: [
                      StoreConnector<AppState, DispatchFunc>(
                        converter: (store) => () => store.dispatch(goHome),
                        builder: (_, goHome) {
                      return Container(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black54),
                            onPressed: goHome,
                          ),
                        );
                      }),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: AppLargeText(text: "Your order")),
                    ],
                  ),
                ),
              SizedBox(height: 30),
              StoreConnector<AppState, List<ProductModel>>(
                converter: (store) => store.state.cartProducts,
                builder: (_, products) {
                return Container(
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SizedBox(
                        height: double.maxFinite,//based on your need
                        width: double.maxFinite,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: products.length, //cartState.products.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width - 170,
                                          child: Column(children: [
                                            Container(
                                              width: double.maxFinite,
                                              child: Text(
                                                'Praline cu caramele',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                                width: double.maxFinite,
                                                child: Text(
                                                  '74.20 LEI - 5 pcs',
                                                  style: TextStyle(
                                                    color: AppColors.mainColor.withOpacity(0.8),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ))
                                          ],),
                                        ),
                                        Expanded(child: Container()),
                                        InkWell(
                                          borderRadius: BorderRadius.circular(30),
                                          splashColor: Colors.black,
                                          onTap: () => {
                                            print('Decrease')
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 50,
                                            padding: EdgeInsets.only(right: 10, left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(35),
                                                    bottomLeft: Radius.circular(35)
                                                ),
                                                color: AppColors.mainColor.withOpacity(0.9)
                                            ),
                                            child: Center(child:
                                            Icon(Icons.remove, color: Colors.white, size: 35)
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        InkWell(
                                          borderRadius: BorderRadius.circular(30),
                                          splashColor: Colors.black,
                                          onTap: () => {
                                            print('Increase')
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 50,
                                            padding: EdgeInsets.only(right: 10, left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(35),
                                                    bottomRight: Radius.circular(35)
                                                ),
                                                color: AppColors.mainColor.withOpacity(0.9)
                                            ),
                                            child: Center(child:
                                            Icon(Icons.add, color: Colors.white, size: 35,)
                                            ),
                                          ),
                                        ),
                                      ],),
                                      SizedBox(height: 20),
                                      Row(children: [
                                        Icon(Icons.access_time, color: AppColors.textColor2, size: 20),
                                        SizedBox(width: 4),
                                        Text(
                                          'Pick up the products between: 10:00 - 22:00',
                                          style: TextStyle(
                                            color: AppColors.textColor2,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],)
                                    ],
                                  ));
                            }
                        )
                      ),
                    ),
                  ),
                );
              }),
              Container(
                height: 100,
                width: 500,
                padding: EdgeInsets.all(5),
                child: Center(
                  child: AppButtons(
                    text: 'Place Order',
                    size: 60,
                    color: AppColors.textColor1,
                    backgroudColor: Colors.white,
                    borderColor: AppColors.textColor1,
                  ),
                ),
              )
            ],
          )
    );
  }
}
