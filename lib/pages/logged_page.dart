import 'package:flutter/material.dart';
import 'package:flutter_cubit/state/states/UserDataState.dart';
import 'package:flutter_cubit/widgets/stateless/app_large_text.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/AppState.dart';
import '../state/actions/user_data_actions/thunk_sign_out.dart';
import '../widgets/stateless/simple_button.dart';


class LoggedPage extends StatefulWidget {
  const LoggedPage({Key? key}) : super(key: key);

  @override
  _LoggedPageState createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserDataState>(
        converter: (store) => store.state.userDataState,
        builder: (_, userState) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 35, left: 20, right: 30),
                  child: Column(
                    children: <Widget>[
                      AppLargeText(text: userState.isProvider ? "Hello Provider" : "Hello User"),
                      SizedBox(height: 40,),
                      Text(userState.name),
                      SizedBox(height: 20,),
                      StoreConnector<AppState, DispatchFunc>(
                          converter: (store) => () => store.dispatch(signOut),
                          builder: (_, signOut) {
                            return Container(
                                width: double.infinity,
                                child: SimpleRoundedButton(
                                  fontSize: 18,
                                  text: 'Sign out',
                                  onPressed: signOut,
                                  height: 50,
                                )
                            );
                          }),
                    ],
                  ),
                )
              ],
            )
          );
    });
  }
}
