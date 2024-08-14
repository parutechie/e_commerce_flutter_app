import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<bool> getPriceDisplayLogic() async {
    await _remoteConfig.fetchAndActivate();
    return _remoteConfig.getBool('display_discounted_price');
  }
}
