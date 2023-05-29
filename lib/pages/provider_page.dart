import 'package:flutter/material.dart';
import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../state/AppState.dart';
import '../widgets/stateful/product_preview.dart';
import '../widgets/stateless/app_large_text.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, ProviderModel>(
        converter: (store) => store.state.selectedProvider!,
        builder: (_, provider) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: Text(provider.name),
                background: Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(provider.products[0].img),
                                fit: BoxFit.cover)),
                      ),
                      AppLargeText(text: provider.name),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(provider.address),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            SliverList(delegate:SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final product = provider.products[index];
                return Container (
                  margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  width: 300,
                  height: 200,
                  child: ProductPreview(product: product, provider: provider,),
                );
              },
              childCount: provider.products.length,
            ),
          ),
          ],
        ),
      );
    })
    );
  }
}
