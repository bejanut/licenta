import 'package:flutter_cubit/state/states/ProductsState.dart';

class AppState {
  ProductsState productsState;

  AppState(
      this.productsState
    );

  AppState.initialState(): productsState = ProductsState.initialState();
}

typedef DispatchFunc = void Function();

enum PageTypes {
  welcomePage,
  loadingPage,
  loadedPage,
  detailPage,
  registerPage,
  cartPage,
  providerPage
}

enum UserPageStates {
  logIn,
  register,
  loggedIn
}