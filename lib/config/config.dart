import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shapp/config/shared_preference/shared_preference_data.dart';

const appName = "Shapp";
const baseUrl = "https://........./";

Future<http.Response> postData({
  var url,
  dynamic data,
  String contentType = "application/json",
}) async {
  String token = UserSimplePeference.getToken();
  try {
    final response = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "Accept": contentType, // "application/json",
        //  'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    return response;
  } catch (e) {
    print(e);
    throw FormatException('Expected at least 1 section');
  }
}

Future<http.Response> getData({
  var url,
  String contentType = "application/json",
}) async {
  String token = UserSimplePeference.getToken();
  try {
    final response = await http.get(url, headers: {
      "content-type": "application/json",
      "Accept": contentType, // "application/json",
      'Authorization': 'Bearer $token',
    });
    return response;
  } catch (e) {
    print(e.toString());
    throw FormatException('Expected at least 1 section');
  }
}

void displayMessage(m) {
  print("===================================");
  print(m);
  print("===================================");
}
