import 'package:shared_preferences/shared_preferences.dart';

import 'user_config.dart';

class PersitenceManager {
  final String store_key = "appconfig";

  Future<UserConfig> loadStore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = preferences.getString(store_key) ??
        appconfigToJson(
          UserConfig.empty(),
        );
    UserConfig config = appconfigFromJson(json);
    return config;
  }

  Future<bool> saveStore(UserConfig config) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = appconfigToJson(config);
    preferences.setString(store_key, json);
    return true;
  }
}
