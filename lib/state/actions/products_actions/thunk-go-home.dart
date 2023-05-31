import 'package:flutter_cubit/state/actions/products_actions/change-current-index.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../AppState.dart';
import 'change-page.dart';

ThunkAction<AppState> goHome = (Store<AppState> store) async {
  store.dispatch(ChangeCurrentIndex(0));

  store.dispatch(ChangePageAction(PageTypes.loadedPage));
};