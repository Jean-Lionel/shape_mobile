import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class MobileCredit {
  dynamic id;
  dynamic codeAgent;
  dynamic nomAgent;
  dynamic tarifCreditSms;
  dynamic tarifCredit;
  dynamic dateModification;
  dynamic dateCreation;
  dynamic ssid;

  MobileCredit({
    this.id,
    this.codeAgent,
    this.nomAgent,
    this.tarifCreditSms,
    this.tarifCredit,
    this.dateModification,
    this.dateCreation,
    this.ssid,
  });

  MobileCredit.fromJson(dynamic json)
      : this.id = json["id"],
        this.codeAgent = json["codeAgent"],
        this.nomAgent = json["nomAgent"],
        this.tarifCreditSms = json["tarifCreditSms"],
        this.tarifCredit = json["tarifCredit"],
        this.dateModification = json["dateModification"],
        this.dateCreation = json["dateCreation"],
        this.ssid = json["ssid"];

  static Future<List<MobileCredit>> getAllCredits() async {
    final response = await getData(url: MOBILE_ALL_CREDITS);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List body = jsonDecode(response.body);
      return body.map((e) => MobileCredit.fromJson(e)).toList();
    }
    throw new Exception("error:  ${response.statusCode} ");
  }
}
