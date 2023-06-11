import 'package:flutter/material.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/set_user_data.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/set_waiting_state.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/update_login_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../../services/auth_services.dart';
import '../../AppState.dart';
import '../products_actions/change-user-page.dart';

ThunkAction<AppState> logIn(String email, String pass, BuildContext context) {
  return (Store<AppState> store) async {
    store.dispatch(SetWaitingStateAction(true));

    String token = await AuthServices.logIn(email, pass);
    Map<String, dynamic> userData = await AuthServices.getData(token);

    store.dispatch(SetUserDataAction(userData));

    String message = "Sign In Failed";
    if (token.compareTo("") != 0) {
      store.dispatch(UpdateLoginStateAction(token));
      store.dispatch(ChangeUserPage(UserPageStates.loggedIn));
      message = "Sign In Successful";
    }

    store.dispatch(SetWaitingStateAction(false));

    var snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
      content: Text(message, textAlign: TextAlign.center));

    ScaffoldMessenger.of(context).showSnackBar(snack);
  };
}
