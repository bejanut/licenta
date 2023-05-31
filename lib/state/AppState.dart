import 'package:flutter_cubit/state/states/ProductsState.dart';
import 'package:flutter_cubit/state/states/UserDataState.dart';

class AppState {
  ProductsState productsState;
  UserDataState userDataState;

  AppState(
      this.productsState,
      this.userDataState,
    );

  AppState.initialState():
    productsState = ProductsState.initialState(),
    userDataState = UserDataState.initialState();
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