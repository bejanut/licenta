import 'package:flutter_cubit/services/data_services.dart';
import 'package:flutter_cubit/state/actions/products_actions/get-data.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../AppState.dart';
import 'change-page.dart';

ThunkAction<AppState> getInfo = (Store<AppState> store) async {
  store.dispatch(ChangePageAction(PageTypes.loadingPage));

  final providers = await DataServices.getInfo();

  store.dispatch(GetDataAction(providers));
  store.dispatch(ChangePageAction(PageTypes.loadedPage));
};