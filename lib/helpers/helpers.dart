import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  static Future<SharedPreferences> getSharedPrefs() async {
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    return sharedPreferences;
  }
  static saveToken(token) async {
    SharedPreferences prefs = await getSharedPrefs();
    prefs.setString('token', token);
  }

  static getUserToken() async {
    SharedPreferences prefs = await getSharedPrefs();
    if(prefs.containsKey('token')){
      return prefs.getString('token');
    }
    return null;
  }
}