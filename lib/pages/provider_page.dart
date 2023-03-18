import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/model/provider_model.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../model/product_preview_model.dart';
import '../widgets/stateful/product_preview.dart';
import '../widgets/stateless/app_large_text.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<AppCubits, CubitStates> (
        builder: (context, state) {
      ProviderState providerState = state as ProviderState;
      ProviderModel provider = providerState.provider;
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
                          Text(provider.location),
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
                final currentProduct = provider.products[index];
                final product = ProductPreviewModel(
                    name: currentProduct.name,
                    imageLink: currentProduct.img,
                    oldPrice: currentProduct.oldPrice,
                    newPrice: currentProduct.newPrice,
                    finishHour: provider.closingHours,
                    offersLeft: currentProduct.left,
                    description: currentProduct.description,//provider.products[index].description,
                    location: provider.location
                );
                return Container (
                  margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  width: 300,
                  height: 200,
                  child: ProductPreview(productModel: product),
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
