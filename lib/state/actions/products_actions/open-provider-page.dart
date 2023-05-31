import 'package:flutter_cubit/model/provider_model.dart';

class OpenProviderPageAction {
  final ProviderModel _selectedProvider;

  ProviderModel get selectedProvider => _selectedProvider;

  OpenProviderPageAction(this._selectedProvider);
}