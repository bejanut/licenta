import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quick_food_deals/pages/welcome_page.dart';

import '../state/AppState.dart';

class AppLogic extends StatefulWidget {
  const AppLogic({Key? key}) : super(key: key);

  @override
  _AppLogicState createState() => _AppLogicState();
}

class _AppLogicState extends State<AppLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          if (state.page_type == 'start_page') {
            return WelcomePage();
          } else
            return Container(child: Text('Test 1'),);
        },
      ),
    );
  }
}
