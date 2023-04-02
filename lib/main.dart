import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/app-logic.dart';
import 'package:flutter_cubit/state/AppReducer.dart';
import 'package:flutter_cubit/state/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: AppLogic(),
      )
    );

  }
}
