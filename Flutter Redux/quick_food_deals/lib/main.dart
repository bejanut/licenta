import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quick_food_deals/pages/app-logic.dart';
import 'package:quick_food_deals/state/AppReducer.dart';
import 'package:quick_food_deals/state/AppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() => runApp(MyApp());

typedef FetchTime = void Function();

class MyApp extends StatelessWidget {

  final store = Store(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);



// root widget
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text("Flutter Redux demo"),
      ),
      body: AppLogic(),
      // body:   Center(
      //   child:   Container(
      //     height: 400.0,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         // display time and location
      //         StoreConnector<AppState, AppState>(
      //           converter: (store) => store.state,
      //           builder: (_, state) {
      //             return  Text(
      //               'The time in ${state.location} is ${state.time}',
      //               textAlign: TextAlign.center,
      //               style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      //             );
      //           },
      //         ),
      //
      //         // fetch time button
      //         StoreConnector<AppState, FetchTime>(
      //           converter: (store) => () => store.dispatch(ChangePageAction(store.state.location, store.state.time, 'start_page')),
      //           builder: (_, changePage) {
      //             return   SizedBox(
      //               width: 250,
      //               height: 50,
      //               child: ElevatedButton(
      //                   style: ButtonStyle(
      //                       backgroundColor: MaterialStateProperty.all(Colors.amber),
      //                       textStyle: MaterialStateProperty.all(
      //                         TextStyle(
      //                           color: Colors.brown,
      //                         ),
      //                       )
      //                   ),
      //                   onPressed: changePage,
      //                   child:   const Text(
      //                     "Click to fetch time",
      //                     style: TextStyle(
      //                         color: Colors.brown,
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 25
      //                     ),
      //                   )
      //               ),
      //             );
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}