import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences;

  static inti() async
  {
    sharedPreferences = await SharedPreferences.getInstance() ;
  }

  static Future<bool> setData({
  required String key,
  required bool value,
}) async
  {
    return await sharedPreferences.setBool(key, value);
  }

  static getData({required String key})
  { sharedPreferences.getBool(key);}
}