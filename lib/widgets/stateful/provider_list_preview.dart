import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/state/actions/open-provider-page.dart';
import 'package:flutter_cubit/state/actions/toggle-provider-favaourite.dart';
import 'package:flutter_cubit/widgets/stateful/product_preview.dart';
import 'package:flutter_cubit/widgets/stateful/toggle_button.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../state/AppState.dart';
import '../../state/actions/open-product-page.dart';
import '../stateless/moving_text.dart';

class ProviderPreviewList extends StatefulWidget {
  final ProviderModel provider;

  const ProviderPreviewList({required this.provider, Key? key}) : super(key: key);

  @override
  _ProviderPreviewListState createState() => _ProviderPreviewListState();
}

class _ProviderPreviewListState extends State<ProviderPreviewList> {
  @override
  Widget build(BuildContext context) {
    final ProviderModel provider = widget.provider;

    return Container(
      margin: const EdgeInsets.only(bottom: 25,),
      child: Column(
          children: [
            StoreConnector<AppState, void Function(ProviderModel index)>(
              converter: (store) => (provider) => store.dispatch(OpenProviderPageAction(provider)),
              builder: (_, openProviderPage) {
              return Container(
            child: InkWell(
              onTap: () => {
                print('Clicked Provider'),
                openProviderPage(provider)
              },
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
                    StoreConnector<AppState, void Function(ProviderModel provider, bool isFavourite)>(
                      converter: (store) => (provider, isFavourites) => store.dispatch(ToggleFavouriteStatus(provider, isFavourites)),
                      builder: (_, toggleFavouriteStatus) {
                        return ToggleButton(
                          pressedFunction: () => {
                            toggleFavouriteStatus(provider, true)
                          },
                          releaseFunction: () => {
                          toggleFavouriteStatus(provider, false)
                          },
                          isPressed: provider.isFavourite
                        );
                    }),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward_ios, size: 30, color: Colors.black54),
                  ],
                ),
              ),
            ),
          );
            }),
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
                          child: ProductPreview(product: product, provider: provider),
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
