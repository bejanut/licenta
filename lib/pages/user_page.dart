import 'package:flutter/cupertino.dart';
import 'package:flutter_cubit/pages/logged_page.dart';
import 'package:flutter_cubit/pages/signin.dart';
import 'package:flutter_cubit/pages/signup.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/AppState.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserPageStates>(
        converter: (store) => store.state.productsState.userPage,
        builder: (_, type) {
          switch (type) {
            case UserPageStates.logIn:
              return const LogInPage();
            case UserPageStates.register:
              return const SignupPage();
            case UserPageStates.loggedIn:
              return const LoggedPage();
          }
        },
      );
  }
}
