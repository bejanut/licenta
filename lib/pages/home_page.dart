import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/state/actions/change-page.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model/provider_model.dart';
import '../state/AppState.dart';
import '../widgets/stateful/provider_list_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu text
                StoreConnector<AppState, DispatchFunc>(
                  converter: (store) => () => store.dispatch(ChangePageAction(PageTypes.cartPage)),
                  builder: (_, goToCart) {
                    return Container(
                      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, size: 30, color: Colors.black54),
                            onPressed: goToCart,
                          ),
                          Expanded(child: Center(child: AppLargeText(text: "Current Offers"))),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart, size: 30, color: Colors.black54),
                            onPressed: goToCart,
                          ),
                        ],
                      ),
                    );
                }),
                SizedBox(height: 20),
                StoreConnector<AppState, List<ProviderModel>>(
                  converter: (store) => store.state.providers,
                  builder: (_, providers) {
                    return Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: SizedBox(
                            height: double.maxFinite,//based on your need
                            width: double.maxFinite,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: providers.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return ProviderPreviewList(provider: providers[index]);
                                }
                            )
                        ),
                      ),
                    );
                  }
                ),
              ],
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
