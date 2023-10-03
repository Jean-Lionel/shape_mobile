import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class UserProfile {
  Future<String> eventProfile() async {
    final response = await getData(url: EVENEMENT_PROFILE);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var rep = jsonDecode(response.body);
      //print(rep["quantite_evenement"]);
      return rep["quantite_evenement"];
    }
    return "";
  }
}
