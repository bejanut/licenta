import 'package:flutter_cubit/state/reducers/ProductsReducer.dart';

import 'AppState.dart';

AppState reducer(AppState state, dynamic action) {
  AppState newState = state;

  newState.productsState = productsReducer(state.productsState, action);

  return newState;
}