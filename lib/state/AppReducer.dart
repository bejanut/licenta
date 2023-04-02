import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/state/actions/change-current-index.dart';
import 'package:flutter_cubit/state/actions/open-product-page.dart';
import 'package:flutter_cubit/state/actions/open-provider-page.dart';

import 'AppState.dart';
import 'actions/add_product.dart';
import 'actions/change-page.dart';
import 'actions/change-user-page.dart';
import 'actions/fetch-time.dart';
import 'actions/get-data.dart';
import 'actions/toggle-provider-favaourite.dart';

AppState reducer(AppState state, dynamic action) {
  AppState newState = state;

  if (action is FetchTimeAction) {
    newState.location = action.location;
    newState.time = action.time;

    return newState;
  } else if (action is ChangePageAction) {
    newState.page_type = action.page_type;

    return newState;
  } else if (action is GetDataAction) {
    newState.providers = action.providers;

    return newState;
  } else if (action is OpenProviderPageAction) {
    newState.selectedProvider = action.selectedProvider;
    newState.page_type = PageTypes.providerPage;

    return newState;
  } else if (action is OpenProductPageAction) {
    newState.selectedProduct = action.selectedProduct;
    newState.selectedProvider = action.selectedProvider;
    newState.page_type = PageTypes.detailPage;

    return newState;
  } else if (action is ToggleFavouriteStatus) {
    ProviderModel provider = action.provider;
    provider.isFavourite = action.isFavourite;

    if (action.isFavourite) {
      newState.favouriteProviders[provider.id] = provider;
    } else {
      newState.favouriteProviders.remove(provider.id);
    }

    return newState;
  } else if (action is ChangeCurrentIndex) {
    newState.navigationBarIndex = action.nav_bar_index;

    return newState;
  } else if (action is ChangeUserPage) {
    newState.userPage = action.page_state;

    return newState;
  } else if (action is AddProductToCart) {
    newState.cartProducts.add(action.product);

    return newState;
  } else {
    return state;
  }
}