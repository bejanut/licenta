import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/model/provider_model.dart';

import '../model/product_preview_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];

}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => [];

}

class LoadedState extends CubitStates {
  LoadedState(this.providers, this.index);
  final List<ProviderModel> providers;
  int index;

  @override
  List<Object?> get props => [providers, index];

}

class DetailState extends CubitStates {
  DetailState(this.product);
  final ProductPreviewModel product;

  @override
  List<Object?> get props => [product];

}

class RegisterState extends CubitStates {
  @override
  List<Object?> get props => [];

}

