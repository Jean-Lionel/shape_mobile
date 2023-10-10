

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePeference {
  static late SharedPreferences prefs;
  static const String _keyUserName = "user_name";
  static const String _keyEmail = "user_email";
  static const String _token = "token";
  static const String _codePay = "+243";
  static const String _registerPhoneNumber = "992135899";
  static const String _user_profile = "_user_profile";
  static const String _userInfo = "_userInfo";

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async =>
      await prefs.setString(_keyUserName, userName);
  static Future setUserProfile(String userProfile) async =>
      await prefs.setString(_user_profile, userProfile);
  static Future setUserInfo(String user) async =>
      await prefs.setString(_userInfo, user);

  static Future setUserEmail(String email) async =>
      await prefs.setString(_keyEmail, email);

  static Future setCodePay(String code) async =>
      await prefs.setString(_codePay, code);

  static Future setMobilePhone(String phone) async =>
      await prefs.setString(_registerPhoneNumber, phone);

  static String getRegisterPhoneNumber() =>
      prefs.getString(_registerPhoneNumber) ?? "";
  static String getUserProfile() => prefs.getString(_user_profile) ?? "";
  static String getCountryCode() => prefs.getString(_codePay) ?? "";
  static String getUserName() => prefs.getString(_keyUserName) ?? "";
  static String getEmail() => prefs.getString(_keyEmail) ?? "";
  static String getToken() => prefs.getString(_token) ?? "";
  static String getUserInfo() => prefs.getString(_userInfo) ?? "";

  static String getAuthUserId() {
    return prefs.getString("user_id") ?? "";
  }

  static void lougoutUser() {
    prefs.remove(_keyUserName);
    prefs.remove(_keyEmail);
    prefs.remove(_token);
  }
}
