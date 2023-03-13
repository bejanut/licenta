import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';

import '../model/provider_model.dart';
import '../widgets/stateful/provider_favorite_item.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> with TickerProviderStateMixin {
  List<ProviderModel> providers = [];

  void removeItem(ProviderModel provider) {
    setState(() {
      providers.remove(provider);
    });
  }

  @override
  Widget build(BuildContext context) {
    providers = BlocProvider.of<AppCubits>(context).getFavouriteProviders();

    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu text
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, size: 30, color: Colors.black54),
                        onPressed: () => {
                          BlocProvider.of<AppCubits>(context).registerPage()
                        },
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart, size: 30, color: Colors.black54),
                        onPressed: () => {
                          BlocProvider.of<AppCubits>(context).cartPage()
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                //discover text
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Favourite Providers")),
                SizedBox(height: 20),
                Expanded(
                  child:Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: providers.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return ProviderFavouriteItem(provider: providers[index], removeItem: removeItem,);
                        }
                    ),
                  ),
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