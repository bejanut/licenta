import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../AppState.dart';

ThunkAction<AppState> createAccount = (Store<AppState> store) async {
  // await AuthServices.createAccount(userId, pass);
  print('CREATED');
};