import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<bool> getPriceDisplayLogic() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );
    await _remoteConfig.fetchAndActivate();
    // bool jilla = _remoteConfig.getBool('display_discounted_price');
    // print('Jilaaa ahdadhajd $jilla');
    return _remoteConfig.getBool('display_discounted_price');
  }
}
