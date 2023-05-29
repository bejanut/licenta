import 'package:flutter_cubit/model/provider_model.dart';
import 'package:flutter_cubit/state/actions/change-current-index.dart';
import 'package:flutter_cubit/state/actions/open-product-page.dart';
import 'package:flutter_cubit/state/actions/open-provider-page.dart';
import 'package:flutter_cubit/state/actions/update_product_quantity.dart';

import 'AppState.dart';
import 'actions/add_product.dart';
import 'actions/change-page.dart';
import 'actions/change-user-page.dart';
import 'actions/fetch-time.dart';
import 'actions/get-data.dart';
import 'actions/toggle-provider-favaourite.dart';

AppState reducer(AppState state, dynamic action) {
  AppState newState = state;

  switch (action) {
    case FetchTimeAction: {
      newState.location = action.location;
      newState.time = action.time;

      return newState;
    }
    case ChangePageAction: {
      newState.page_type = action.page_type;

      return newState;
    }
    case GetDataAction: {
      newState.providers = action.providers;

      return newState;
    }
    case OpenProviderPageAction: {
      newState.selectedProvider = action.selectedProvider;
      newState.page_type = PageTypes.providerPage;

      return newState;
    }
    case OpenProductPageAction: {
      newState.selectedProduct = action.selectedProduct;
      newState.selectedProvider = action.selectedProvider;
      newState.page_type = PageTypes.detailPage;

      return newState;
    }
    case ToggleFavouriteStatus: {
      ProviderModel provider = action.provider;
      provider.isFavourite = action.isFavourite;

      if (action.isFavourite) {
        newState.favouriteProviders[provider.id] = provider;
      } else {
        newState.favouriteProviders.remove(provider.id);
      }

      return newState;
    }
    case ChangeCurrentIndex: {
      newState.navigationBarIndex = action.nav_bar_index;

      return newState;
    }
    case ChangeUserPage: {
      newState.userPage = action.page_state;

      return newState;
    }
    case AddProductToCart: {
      var quantity = newState.selectedQuantities[action.product.id] ?? 0;
      if (quantity == 0) {
        newState.cartProducts.add(action.product);
      }

      newState.selectedQuantities[action.product.id] = quantity + 1;

      return newState;
    }
    case UpdateProductQuantity: {
      if (action.quantity <= 0) {
        newState.selectedQuantities.remove(action.productId);
        newState.cartProducts.removeWhere((p) => p.id == action.productId);
      } else {
        newState.selectedQuantities[action.productId] = action.quantity;
      }

      return newState;
    }
    default: return state;
  }
}