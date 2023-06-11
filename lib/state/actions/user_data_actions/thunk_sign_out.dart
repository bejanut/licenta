import 'package:flutter/material.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/set_user_data.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/set_waiting_state.dart';
import 'package:flutter_cubit/state/actions/user_data_actions/update_login_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../../services/auth_services.dart';
import '../../AppState.dart';
import '../products_actions/change-user-page.dart';

ThunkAction<AppState> signOut = (Store<AppState> store) {
    store.dispatch(UpdateLoginStateAction(""));
    store.dispatch(ChangeUserPage(UserPageStates.logIn));
};
