import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class Invitation {
  Invitation.fromJson(dynamic json);
  static Future<List<Invitation>?> getInvitation(var idPlaces) async {
    final urlData = makeUrl("view/invitations/", params: idPlaces);
    final response = await getData(url: urlData);
    final List body = jsonDecode(response.body);
    print("La liste des places ");
    print(body);
    //return body.map((e) => Invitation.fromJson(e)).toList();
  }
}
