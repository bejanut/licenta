import '../../../model/provider_model.dart';

class GetDataAction {
  final List<ProviderModel> _providers;

  List<ProviderModel> get providers => _providers;

  GetDataAction(this._providers);
}