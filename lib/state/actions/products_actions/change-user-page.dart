import 'package:flutter_cubit/state/AppState.dart';

class ChangeUserPage {
  final UserPageStates _page_state;

  UserPageStates get page_state => _page_state;

  ChangeUserPage(this._page_state);
}