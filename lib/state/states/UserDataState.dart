import '../../model/product_model.dart';
import '../../model/provider_model.dart';
import '../AppState.dart';

class UserDataState {
  bool isLoggedIn = false;
  bool isProvider = false;
  bool isWaiting = false;
  String token = "";
  String email = "";
  String name = "";
  String address = "";
  String phoneNumber = "";
  num lat = 0;
  num lon = 0;
  int startHour = 0;
  int closeHour = 0;


  UserDataState(
    this.isLoggedIn,
    this.isProvider,
    this.isWaiting,
    this.token,
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.lat,
    this.lon,
    this.startHour,
    this.closeHour,
    );

  UserDataState.initialState();
}