import 'package:flutter_cubit/state/actions/user_data_actions/set_waiting_state.dart';
import '../actions/user_data_actions/set_user_data.dart';
import '../actions/user_data_actions/update_login_state.dart';
import '../states/UserDataState.dart';


UserDataState userDataReducer(UserDataState state, dynamic action) {
  UserDataState newState = state;

  if (action is UpdateLoginStateAction) {
    newState.token = action.token;
    if (action.token.compareTo("") == 0) {
      newState = UserDataState.initialState();
    } else {
      newState.isLoggedIn = true;
    }
  } else if (action is SetWaitingStateAction) {
    newState.isWaiting = action.isWaiting;
  } else if (action is SetUserDataAction) {
    if (action.userData["providerInfo"] == null) {
      newState.name = action.userData["name"];
    } else {
      newState.isProvider = true;
      newState.name = action.userData["providerInfo"]["name"];
      newState.address = action.userData["providerInfo"]["address"];
      newState.lat = action.userData["providerInfo"]["lat"];
      newState.lon = action.userData["providerInfo"]["lon"];
      newState.startHour = action.userData["providerInfo"]["startHour"];
      newState.closeHour = action.userData["providerInfo"]["closeHour"];
    }
  }

  return newState;
}