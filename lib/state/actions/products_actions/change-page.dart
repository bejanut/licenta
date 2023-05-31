import '../../AppState.dart';

class ChangePageAction {
  final PageTypes _page_type;

  PageTypes get page_type => _page_type;

  ChangePageAction(this._page_type);
}