import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';

import '../widgets/stateful/provider_list_preview.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates> (
        builder: (context, state) {
          CartState cartState = state as CartState;
          var products = cartState.products;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black54),
                      onPressed: () => {
                        BlocProvider.of<AppCubits>(context).goHome(0)
                      },
                    ),
                    Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Your order")),
                  ],
                ),
              ),
              SizedBox(height: 30),
              //discover text
              Expanded(
                child:Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: cartState.products.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(child: Text('Am produs'));
                      }
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 20),
              //   height: 300,
              //   width: double.maxFinite,
              //   child: TabBarView(
              //     controller: _tabController,
              //     children: [
              //       ListView.builder(
              //         itemCount: info.length,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (BuildContext context, int index) {
              //           return GestureDetector(
              //             onTap: () {
              //               BlocProvider.of<AppCubits>(context).detailPage(info[index]);
              //             },
              //             child: Container(
              //               margin: const EdgeInsets.only(right: 15, top: 10),
              //               width: 200,
              //               height: 300,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   color: Colors.white,
              //                   image: DecorationImage(
              //                       image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
              //                       fit: BoxFit.cover)),
              //             ),
              //           );
              //         },
              //       ),
              //       Text("There"),
              //       Text("Bye")
              //     ],
              //   ),
              // ),
              // SizedBox(height: 30),
              // Container(
              //   margin: const EdgeInsets.only(left: 20, right: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       AppLargeText(text: "Explore more", size: 22),
              //       AppText(text: "See all", color: AppColors.textColor1),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10),
              // Container(
              //   height: 120,
              //   width: double.maxFinite,
              //   margin: const EdgeInsets.only(left: 20),
              //   child: ListView.builder(
              //       itemCount: 4,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (_, index) {
              //         return Container (
              //           margin: const EdgeInsets.only(right: 30),
              //           child: Column(
              //             children: [
              //               Container(
              //                 width: 80,
              //                 height: 80,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(20),
              //                     color: Colors.white,
              //                     image: DecorationImage(
              //                         image: AssetImage("img/" + images.keys.elementAt(index)),
              //                         fit: BoxFit.cover)),
              //               ),
              //               SizedBox(height: 10),
              //               Container(
              //                 child: AppText(
              //                     text: images.values.elementAt(index),
              //                     color: AppColors.textColor2
              //                 ),
              //               )
              //             ],
              //           ),
              //         );
              //       }),
              // )
            ],
          );
        },
      )
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}


//tabbar
// Container(
//     child: Container(
//       alignment: Alignment.centerLeft,
//       child: TabBar(
//           labelPadding: const EdgeInsets.only(left: 20, right: 20),
//           controller: _tabController,
//           labelColor: Colors.black,
//           unselectedLabelColor: Colors.grey,
//           isScrollable: true,
//           indicatorSize: TabBarIndicatorSize.label,
//           indicator:
//           CircleTabIndicator(color: AppColors.mainColor, radius: 4),
//           tabs: [
//             Tab(text: "Places"),
//             Tab(text: "Inspiration"),
//             Tab(text: "Emotions"),
//           ]),
//     )),