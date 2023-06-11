import 'package:flutter_cubit/state/reducers/ProductsReducer.dart';
import 'package:flutter_cubit/state/reducers/UserDataReducer.dart';

import 'AppState.dart';

AppState reducer(AppState state, dynamic action) {
  AppState newState = state;

  newState.productsState = productsReducer(state.productsState, action);
  newState.userDataState = userDataReducer(state.userDataState, action);

  return newState;
}