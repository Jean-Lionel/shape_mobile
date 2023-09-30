import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePeference {
  static late SharedPreferences prefs;
  static const String _keyUserName = "user_name";
  static const String _keyEmail = "user_email";
  static const String _token = "token";
  static const String _ipAdress = "127.0.0.1";

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async =>
      await prefs.setString(_keyUserName, userName);

  static Future setApiAdress(String ip) async =>
      await prefs.setString(_ipAdress, ip);

  static Future setUserEmail(String email) async =>
      await prefs.setString(_keyEmail, email);

  static String getUserName() => prefs.getString(_keyUserName) ?? "";
  static String getIpAdress() => prefs.getString(_ipAdress) ?? "";
  static String getEmail() => prefs.getString(_keyEmail) ?? "";
  static String getToken() => prefs.getString(_token) ?? "";

  static void lougoutUser() {
    prefs.remove(_keyUserName);
    prefs.remove(_keyEmail);
    prefs.remove(_token);
  }
}
