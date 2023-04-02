import '../../model/provider_model.dart';

class ToggleFavouriteStatus {
  final ProviderModel _provider;
  final bool _isFavourite;

  ProviderModel get provider => _provider;
  bool get isFavourite => _isFavourite;

  ToggleFavouriteStatus(this._provider, this._isFavourite);
}