import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class Place {
  dynamic id;
  dynamic nomPlace;
  dynamic nombre;
  dynamic prix;
  dynamic devise;
  dynamic etat;
  dynamic dateModification;
  dynamic dateCreation;

  Place({
    this.id,
    this.nomPlace,
    this.nombre,
    this.prix,
    this.devise,
    this.etat,
    this.dateModification,
    this.dateCreation,
  });

  Place.fromJson(dynamic json)
      : this.id = json["id"],
        this.nomPlace = json["nomPlace"],
        this.nombre = json["nombre"],
        this.prix = json["prix"],
        this.devise = json["devise"],
        this.etat = json["etat"],
        this.dateModification = json["dateModification"],
        this.dateCreation = json["dateCreation"];

  static Future<List<Place>> getPlaces(var idEvent) async {
    final urlData = makeUrl("evenement/places/", params: idEvent);
    final response = await getData(url: urlData);
    final List body = jsonDecode(response.body);

    return body.map((e) => Place.fromJson(e)).toList();
  }

  static Future<List<Place>> getInvitations(var idPlace) async {
    final urlData = makeUrl("view/invitations/", params: idPlace);
    final response = await getData(url: urlData);
    final List body = jsonDecode(response.body);
    print("================================");
    print(body);
    print("================================");

    return body.map((e) => Place.fromJson(e)).toList();
  }

  static Future<bool> savePersonToInvitation(
      dynamic bodyRequest, place_id, event_id, codeItem) async {
    String code = "$event_id $place_id $codeItem";
    final currentUrl = makeUrl("save/invite/", params: '$place_id/$code');

    final response = await postData(url: currentUrl, data: bodyRequest);

    print("============${response.statusCode}====================");
    print("Error: ${response.body}");

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }
}
