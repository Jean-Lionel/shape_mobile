// URL DU SERVEUR
final String IP_ADDRESS = "http://shappu-v2.eu-north-1.elasticbeanstalk.com/";

Uri makeUrl(String url) {
  String full_url = IP_ADDRESS + url;
  return Uri.parse(full_url);
}

const requestHeaders = {};

final LOGIN_URL = makeUrl("login");
final SEND_OTP = makeUrl("sendotp");
final REGISTER_USER = makeUrl("user/register");
final USER_PROFILE = makeUrl("user/profile");
final EVENEMENT_PROFILE = makeUrl("evenement/profile");
final CREDIT_PROFILE = makeUrl("credit/profile");
final VERIFY_OTP = makeUrl("verifyotp");
