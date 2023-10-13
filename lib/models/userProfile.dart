import 'dart:convert';

import 'package:http/http.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';
import 'package:shapp/config/shared_preference/shared_preference_data.dart';

class UserProfile {
  static Future<String> eventProfile() async {
    final response = await getData(url: EVENEMENT_PROFILE);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var rep = jsonDecode(response.body);
      return rep["quantite_evenement"];
    }
    return "";
  }

  static Future<String> credit_sms() async {
    final response = await getData(url: CREDIT_SMS_PROFILE);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var rep = jsonDecode(response.body);
      return rep["quantite_credit_sms"];
    }
    return "";
  }

  static Future<String> quantiteCredit() async {
    final response = await getData(url: CREDIT_QUANTITE);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var rep = jsonDecode(response.body);
      return rep["quantite_credit"];
    }
    return "";
  }

  static Future<String> saveCredit(transaction, currentPM, price) async {
    var bodyItem = {
      "reseau": currentPM,
      "quantite": price,
      "reference_no": transaction
    };
    final response = await postData(
      url: CREDIT_ACHAT,
      data: bodyItem,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    }
    throw new Exception("Error: ${response.statusCode}");
  }

  static Future<String> saveMessage(transaction, currentPM, price) async {
    var bodyItem = {
      "reseau": currentPM,
      "quantite": price,
      "reference_no": transaction
    };
    final response = await postData(
      url: ACHAT_SMS,
      data: bodyItem,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    }
    print("================================");
    print(response.body);
    throw new Exception("Error: ${response.statusCode}");
  }
}
