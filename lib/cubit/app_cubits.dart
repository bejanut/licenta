import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/model/product_model.dart';
import 'package:flutter_cubit/model/product_preview_model.dart';
import 'package:flutter_cubit/services/data_services.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final providers;
  List<ProductModel> cartProducts = [];
  List<ProductModel> favouriteProducts = [];

  void getData() async {
    try {
      emit(LoadingState());
      providers = await data.getInfo();
      emit(LoadedState(providers, 0));
    } catch(e) {
      print(e);
    }
  }

  detailPage(ProductPreviewModel data) {
    emit(DetailState(data));
  }

  goHome(int index) {
    emit(LoadedState(providers, index));
  }

  registerPage() {
    emit(RegisterState());
  }
}