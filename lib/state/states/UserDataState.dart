import '../../model/product_model.dart';
import '../../model/provider_model.dart';
import '../AppState.dart';

class UserDataState {
  bool isLoggedIn;
  String token;
  String name;
  String address;
  String email;
  String phoneNumber;

  UserDataState(
    this.isLoggedIn,
    this.token,
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    );

  UserDataState.initialState() :
    isLoggedIn = false,
    token = "",
    name = "",
    address = "",
    email = "",
    phoneNumber = "";
}