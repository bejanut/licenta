import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/state/actions/products_actions/change-page.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model/provider_model.dart';
import '../state/AppState.dart';
import '../state/actions/products_actions/open-product-page.dart';
import '../state/actions/products_actions/thunk-get-info.dart';
import '../widgets/stateful/product_preview.dart';
import '../widgets/stateless/moving_text.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            StoreConnector<AppState, ProviderModel>(
                converter: (store) => store.state.productsState.selectedProvider!,
                builder: (_, provider) {
                  return StoreConnector<AppState, DispatchFunc>(
                      converter: (store) => () => store.dispatch(ChangePageAction(PageTypes.loadedPage)),
                      builder: (_, goBack) {
                        return StoreConnector<AppState, DispatchFunc>(
                          converter: (store) => () => store.dispatch(ChangePageAction(PageTypes.cartPage)),
                          builder: (_, goToCart) {
                            return Container(
                            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black54),
                                  onPressed: goBack,
                                ),
                                Expanded(child: MovingText(
                                  text: provider.name,
                                  maxLength: 20,
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                IconButton(
                                  icon: const Icon(Icons.shopping_cart, size: 30, color: Colors.black54),
                                  onPressed: goToCart,
                                ),
                              ],
                            ),
                          );
                        });
                      });
            }),
            SizedBox(height: 20),
            StoreConnector<AppState, DispatchFunc>(
                converter: (store) => () => store.dispatch(getInfo),
                builder: (_, loadMainPage) {
                  return StoreConnector<AppState, ProviderModel>(
                      converter: (store) => store.state.productsState.selectedProvider!,
                      builder: (_, provider) {
                        return Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: SizedBox(
                                height: double.maxFinite,//based on your need
                                width: double.maxFinite,
                                child: RefreshIndicator (
                                  onRefresh: () => Future(() => loadMainPage()),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: provider.products.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context, int index) {
                                      final product = provider.products[index];

                                      return StoreConnector<AppState, DispatchFunc>(
                                        converter: (store) => () => store.dispatch(OpenProductPageAction(product, provider)),
                                        builder: (_, goToDetailPage) {
                                          return GestureDetector(
                                              onTap: goToDetailPage,
                                              child: Container (
                                                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                                                width: 350,
                                                height: 230,
                                                child: ProductPreview(product: product, provider: provider),
                                              )
                                          );
                                        }
                                      );
                                    },
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  );
                }),
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
