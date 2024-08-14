import 'package:infinity/services/remote_config_service.dart';

class RemoteConfigController {
  final RemoteConfigService _remoteConfigService = RemoteConfigService();

  Future<bool> shouldDisplayDiscountedPrice() async {
    return await _remoteConfigService.getPriceDisplayLogic();
  }
}
