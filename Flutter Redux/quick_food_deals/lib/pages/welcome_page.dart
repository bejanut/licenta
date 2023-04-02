import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quick_food_deals/state/actions/change-page.dart';
import '../misc/colors.dart';
import '../state/AppState.dart';
import '../widgets/stateless/app_large_text.dart';
import '../widgets/stateless/app_text.dart';
import '../widgets/stateless/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

typedef DispatchFunc = void Function();

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
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
              converter: (store) => () => store.dispatch(ChangePageAction('Test 1')),
              builder: (_, changePage) {
                return Container(
                    margin: const EdgeInsets.only(top:150, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: "Trips",),
                            AppText(text: "Mountain", size: 30,),
                            SizedBox(height: 20,),
                            Container(
                              width: 250,
                              child: AppText(
                                  text: "Mountain hikes give you an incredible sense of freedom along with endurance test.",
                                  color: AppColors.textColor2),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                print('Clicked Welcome');
                                changePage();
                              },
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
              },
          )
        );
      }),
    );
  }
}
