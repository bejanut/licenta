import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_cubit/widgets/stateless/responsive_button.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/AppState.dart';
import '../state/actions/products_actions/thunk-get-info.dart';
import '../widgets/stateless/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "pizza.jpeg",
    "field.jpeg",
    "waste.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/"+images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: StoreConnector<AppState, DispatchFunc>(
                converter: (store) => () => store.dispatch(getInfo),
                builder: (_, loadMainPage) {
                  return Container(
                      margin: const EdgeInsets.only(top:170, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(text: "Quick Food Deals",),
                              SizedBox(height: 20,),
                              Container(
                                width: 250,
                                child: AppText(
                                    text: "Eat at great prices and save the world",
                                    color: AppColors.textColor2),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: loadMainPage,
                                child: Container(
                                    width: 150,
                                    child: Row(children: [ResponsiveButton(width: 120)])),
                              )
                            ],
                          ),
                          Column(
                            children: List.generate(3, (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: index==indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index==indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                                ),
                              );
                            }),
                          )
                        ],
                      )
                  );
                }
            )
          );
      }),
    );
  }
}
