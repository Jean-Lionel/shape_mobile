import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePeference {
  static late SharedPreferences prefs;
  static const String _keyUserName = "user_name";
  static const String _keyEmail = "user_email";
  static const String _token = "token";
  static const String _codePay = "+243";
  static const String _registerPhoneNumber = "992135899";

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async =>
      await prefs.setString(_keyUserName, userName);
  static Future setUserEmail(String email) async =>
      await prefs.setString(_keyEmail, email);

  static Future setCodePay(String code) async =>
      await prefs.setString(_codePay, code);

  static Future setMobilePhone(String phone) async =>
      await prefs.setString(_registerPhoneNumber, phone);

  static String getRegisterPhoneNumber() =>
      prefs.getString(_registerPhoneNumber) ?? "";
  static String getCountryCode() => prefs.getString(_codePay) ?? "";
  static String getUserName() => prefs.getString(_keyUserName) ?? "";
  static String getEmail() => prefs.getString(_keyEmail) ?? "";
  static String getToken() => prefs.getString(_token) ?? "";

  static void lougoutUser() {
    prefs.remove(_keyUserName);
    prefs.remove(_keyEmail);
    prefs.remove(_token);
  }
}
