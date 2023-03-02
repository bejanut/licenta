import 'package:equatable/equatable.dart';

import '../model/data_model.dart';
import '../model/product_preview_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadedState extends CubitStates {
  LoadedState(this.places, this.index);
  final List<DataModel> places;
  int index;

  @override
  // TODO: implement props
  List<Object?> get props => [places, index];

}

class DetailState extends CubitStates {
  DetailState(this.product);
  final ProductPreviewModel product;

  @override
  // TODO: implement props
  List<Object?> get props => [product];

}

class RegisterState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

