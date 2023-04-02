import 'package:quick_food_deals/state/actions/change-page.dart';

import 'AppState.dart';
import 'actions/fetch-time.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time, state.page_type);
  } else if (action is ChangePageAction) {
    return AppState(state.location, state.time, action.page_type);
  } else {
    return state;
  }
}