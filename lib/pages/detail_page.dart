import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/stateless/app_buttons.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_cubit/widgets/stateless/app_text.dart';

import '../misc/colors.dart';
import '../widgets/stateless/simple_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

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
                          image:  NetworkImage(detail.product.imageLink),
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
                      IconButton(onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome(0);
                      }, icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white),
                      Expanded(child: Container()),
                      Icon(Icons.shopping_cart, size: 30, color: Colors.white),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: detail.product.name, color: Colors.black.withOpacity(0.8)),
                            Row(
                                children: [
                                  Text(
                                    state.product.oldPrice.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.red.withOpacity(0.8),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    state.product.newPrice.toStringAsFixed(2) + ' LEI',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor),
                            SizedBox(width: 5),
                            AppText(text: detail.product.location, color: AppColors.textColor1)
                          ],),
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
                                      'Ends at: ' + state.product.getFinishHour(),
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
                                      'Offers left: ' + state.product.offersLeft.toString(),
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
                        AppText(text: detail.product.description, color: AppColors.mainTextColor),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroudColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SimpleRoundedButton(
                          fontSize: 18,
                          text: 'Add to cart',
                          onPressed: () => {
                            print('Add to cart')
                          },
                          height: 50,
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      );
    });
  }
}
