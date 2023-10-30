import 'package:shapp/config/shared_preference/shared_preference_data.dart';

//final String IP_ADDRESS = "http://shappu-v2.eu-north-1.elasticbeanstalk.com/";
final String IP_ADDRESS = "http://192.168.154.138:8080/";

Uri makeUrl(String url, {dynamic params = ""}) {
  String fullUrl = '$IP_ADDRESS$url$params';
  return Uri.parse(fullUrl);
}

String user_id = UserSimplePeference.getAuthUserId();

const requestHeaders = {};

final LOGIN_URL = makeUrl("login");
final SEND_OTP = makeUrl("sendotp");
final REGISTER_USER = makeUrl("user/register");
final USER_PROFILE = makeUrl("user/profile");
final EVENEMENT_PROFILE = makeUrl("evenement/profile");
final CREDIT_QUANTITE = makeUrl("credit/profile");
final CREDIT_SMS_PROFILE = makeUrl("credit/sms/profile");
final VERIFY_OTP = makeUrl("verifyotp");
final CREDIT_ACHAT = makeUrl("credit/achat/$user_id");
final ACHAT_SMS = makeUrl("credit/achat/sms/$user_id");
final SAVE_EVENT_DATA = makeUrl("save/evenement");
final GET_EVENT_DATA = makeUrl("evenements");
final EVENT_PLACE = makeUrl("evenement/places/");
final MOBILE_ALL_CREDITS = makeUrl("mobilesAllCredits");
//Changer l'état de l’invitation pour signaler l'entrée
