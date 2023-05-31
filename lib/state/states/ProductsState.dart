import '../../model/product_model.dart';
import '../../model/provider_model.dart';
import '../AppState.dart';

class ProductsState {
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

  ProductsState(
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

  ProductsState.initialState() :
        location = "",
        time = "00:00",
        page_type = PageTypes.welcomePage,
        selectedProvider = null,
        selectedProduct = null,
        providers = [],
        navigationBarIndex = 0;
}