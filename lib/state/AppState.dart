import '../model/product_model.dart';
import '../model/provider_model.dart';

class AppState {
  String location;
  String time;
  PageTypes page_type;
  List<ProviderModel> providers;
  int navigationBarIndex;
  UserPageStates userPage = UserPageStates.logIn;
  ProviderModel? selectedProvider;
  ProductModel? selectedProduct;
  List<ProductModel> cartProducts = [];
  Map<int, ProviderModel> favouriteProviders = {};
  Map<String, int> selectedQuantities = {};

  AppState(
      this.location,
      this.time,
      this.page_type,
      this.providers,
      this.navigationBarIndex,
      this.selectedProvider,
      this.selectedProduct,
      this.cartProducts,
      this.favouriteProviders
    );

  AppState.initialState() :
        location = "",
        time = "00:00",
        page_type = PageTypes.welcomePage,
        selectedProvider = null,
        selectedProduct = null,
        providers = [],
        navigationBarIndex = 0;
}

typedef DispatchFunc = void Function();

enum PageTypes {
  welcomePage,
  loadingPage,
  loadedPage,
  detailPage,
  registerPage,
  cartPage,
  providerPage
}

enum UserPageStates {
  logIn,
  register,
  loggedIn
}