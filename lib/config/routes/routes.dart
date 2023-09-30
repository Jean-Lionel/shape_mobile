// URL DU SERVEUR
final String IP_ADDRESS = "http://shappu-v2.eu-north-1.elasticbeanstalk.com/";

Uri makeUrl(String url) {
  String full_url = IP_ADDRESS + url;
  return Uri.parse(full_url);
}

const requestHeaders = {};

final LOGIN_URL = makeUrl("login");
final REGISTER_USER = makeUrl("user/register");
