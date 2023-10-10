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
}
