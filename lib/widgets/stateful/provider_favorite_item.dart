import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/widgets/stateful/product_preview.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../model/product_preview_model.dart';
import '../../state/AppState.dart';
import '../../state/actions/open-product-page.dart';
import '../../state/actions/toggle-provider-favaourite.dart';
import '../stateless/moving_text.dart';

class ProviderFavouriteItem extends StatefulWidget {
  final ProviderModel provider;

  const ProviderFavouriteItem({
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
                      StoreConnector<AppState, DispatchFunc>(
                          converter: (store) => () => store.dispatch(ToggleFavouriteStatus(provider, false)),
                          builder: (_, deleteFavourite) {
                          return InkWell(
                              onTap: deleteFavourite,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(Icons.delete_outline, size: 30, color: Colors.black)
                              )
                          );
                      }),
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
                  final product = provider.products[index];

                  return StoreConnector<AppState, DispatchFunc>(
                    converter: (store) => () => store.dispatch(OpenProductPageAction(product, provider)),
                    builder: (_, goToDetailPage) {
                      return GestureDetector(
                        onTap: goToDetailPage,
                        child: Container (
                          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                          width: 300,
                          height: 200,
                          child: ProductPreview(product: product, provider: provider,),
                        )
                    );
                  });
                },
              ),
            ),
          ]
      ),
    );
  }
}
