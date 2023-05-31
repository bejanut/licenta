import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/state/actions/products_actions/change-current-index.dart';
import 'package:flutter_cubit/state/actions/products_actions/open-product-page.dart';
import 'package:flutter_cubit/state/actions/products_actions/open-provider-page.dart';
import 'package:flutter_cubit/state/actions/products_actions/update_product_quantity.dart';

import '../AppState.dart';
import '../actions/products_actions/add_product.dart';
import '../actions/products_actions/change-page.dart';
import '../actions/products_actions/change-user-page.dart';
import '../actions/products_actions/fetch-time.dart';
import '../actions/products_actions/get-data.dart';
import '../actions/products_actions/toggle-provider-favaourite.dart';
import '../states/ProductsState.dart';



ProductsState productsReducer(ProductsState state, dynamic action) {
  ProductsState newState = state;

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
    var quantity = newState.selectedQuantities[action.product.id] ?? 0;
    if (quantity == 0) {
      newState.cartProducts.add(action.product);
    }

    newState.selectedQuantities[action.product.id] = quantity + 1;

    return newState;
  } else if (action is UpdateProductQuantity) {
    if (action.quantity <= 0) {
      newState.selectedQuantities.remove(action.productId);
      newState.cartProducts.removeWhere((p) => p.id == action.productId);
    } else {
      newState.selectedQuantities[action.productId] = action.quantity;
    }

    return newState;
  } else {
    return state;
  }
}