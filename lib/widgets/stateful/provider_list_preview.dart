import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/widgets/stateful/product_preview.dart';

import '../../cubit/app_cubits.dart';
import '../../model/data_model.dart';
import '../../model/product_preview_model.dart';

class ProviderPreviewList extends StatefulWidget {
  final List<DataModel> providers;

  const ProviderPreviewList({required this.providers, Key? key}) : super(key: key);

  @override
  _ProviderPreviewListState createState() => _ProviderPreviewListState();
}

class _ProviderPreviewListState extends State<ProviderPreviewList> {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    final List<DataModel> providers = widget.providers;

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
                      Text(
                          'Provider',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
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
                itemCount: providers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final product = ProductPreviewModel(
                      name: 'Produsul ' + index.toString(),
                      imageLink: 'http://mark.bslmeiyu.com/uploads/' + providers[index].img,
                      oldPrice: 20.67,
                      newPrice: 7.86,
                      finishHour: 2215,
                      offersLeft: 6,
                      description: 'Acest produs este foate bun si delicios',
                      location: 'Strada Mare Nr. 20'
                  );

                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).detailPage(product);
                        // print('Product $index Clicked');
                      },
                      child: Container (
                        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                        width: 300,
                        height: 200,
                        child: ProductPreview(productModel: product),
                      )
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}
