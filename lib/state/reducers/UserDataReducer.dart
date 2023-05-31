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
import '../states/UserDataState.dart';



UserDataState userDataReducer(UserDataState state, dynamic action) {
  UserDataState newState = state;

  return newState;
}