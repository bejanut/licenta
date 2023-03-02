import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/model/product_preview_model.dart';
import 'package:flutter_cubit/services/data_services.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places, 0));
    } catch(e) {
      print(e);
    }
  }

  detailPage(ProductPreviewModel data) {
    emit(DetailState(data));
  }

  goHome(int index) {
    emit(LoadedState(places, index));
  }

  registerPage() {
    emit(RegisterState());
  }
}