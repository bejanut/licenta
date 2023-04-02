class AppState {
  final String _location;
  final String _time;
  final String _page_type;

  String get location => _location;
  String get time => _time;
  String get page_type => _page_type;

  AppState(this._location, this._time, this._page_type);

  AppState.initialState() : _location = "", _time = "00:00", _page_type = "start_page";

}