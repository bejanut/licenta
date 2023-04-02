import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/provider_page.dart';
import 'package:flutter_cubit/pages/signup.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/AppState.dart';
import 'cart_page.dart';
import 'detail_page.dart';
import 'navpages/main_page.dart';

class AppLogic extends StatefulWidget {
  const AppLogic({Key? key}) : super(key: key);

  @override
  _AppLogicState createState() => _AppLogicState();
}

class _AppLogicState extends State<AppLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, PageTypes>(
        converter: (store) => store.state.page_type,
        builder: (_, type) {
          switch (type) {
            case PageTypes.welcomePage:
              return const WelcomePage();
            case PageTypes.loadingPage:
              return const Center(child: CircularProgressIndicator());
            case PageTypes.loadedPage:
              return const MainPage();
            case PageTypes.detailPage:
              return const DetailPage();
            case PageTypes.registerPage:
              return const SignupPage();
            case PageTypes.cartPage:
              return const CartPage();
            case PageTypes.providerPage:
              return const ProviderPage();
          }
        },
      ),
    );
  }
}
