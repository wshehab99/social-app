import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required value}) async {
    if (value is bool) {
      return await preferences!.setBool(key, value);
    } else if (value is double) {
      return await preferences!.setDouble(key, value);
    } else if (value is int) {
      return await preferences!.setInt(key, value);
    } else {
      return await preferences!.setString(key, value);
    }
  }

  static Future<dynamic> getData({required String key}) async {
    return preferences!.get(key);
  }

  static Future<bool> deleteData({required String key}) async {
    return preferences!.remove(key);
  }
}
