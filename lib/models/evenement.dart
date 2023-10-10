import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class Evenement {
  dynamic id;
  String? typeEvenement;
  String? nomEvenement;
  String? dateEvenement;
  String? heureEvenement;
  String? dateFinEvenement;
  String? heureFinEvenement;
  String? adresseEvenement;
  String? emailResponsable;
  String? numeroContact1;
  String? numeroContact2;
  String? places;
  String? autresInfos;
  String? file;
  String? logoImage;

  Evenement({
    this.typeEvenement,
    this.nomEvenement,
    this.dateEvenement,
    this.heureEvenement,
    this.dateFinEvenement,
    this.heureFinEvenement,
    this.adresseEvenement,
    this.emailResponsable,
    this.numeroContact1,
    this.numeroContact2,
    this.places,
    this.autresInfos,
    this.file,
    this.logoImage,
  });

  Evenement.fromJson(dynamic json)
      : this.id = json['id'],
        this.typeEvenement = json['typeEvenement'],
        this.nomEvenement = json['nomEvenement'],
        this.dateEvenement = json['dateEvenement'],
        this.heureEvenement = json['heureEvenement'],
        this.dateFinEvenement = json['dateFinEvenement'],
        this.heureFinEvenement = json['heureFinEvenement'],
        this.adresseEvenement = json['adresseEvenement'],
        this.emailResponsable = json['emailResponsable'],
        this.numeroContact1 = json['numeroContact1'],
        this.numeroContact2 = json['numeroContact2'],
        this.places = json['places'],
        this.autresInfos = json['autresInfos'],
        this.logoImage = json['logoImage'],
        this.file = json['file'];

  String? get eventTime {
    var items = dateEvenement!.split("-");
    return "Le ${items[2]}/${items[1]}/${items[0]} à $heureEvenement";
  }

  static Future<String> saveEvent(dynamic bodyItem) async {
    final response = await postData(
      url: SAVE_EVENT_DATA,
      data: bodyItem,
      contentType: "application/x-www-form-urlencoded",
    );
    print("==================BODY==============================");
    print(bodyItem);
    print(response.statusCode);
    print(response.body);

    return response.body;
  }

  static Future<List<Evenement>> getEvenemts() async {
    final response = await getData(url: GET_EVENT_DATA);

    final List body = jsonDecode(response.body);

    return body.map((e) => Evenement.fromJson(e)).toList();
  }

  static Future<void> getPlaces(var idEvent) async {
    final urlData = makeUrl("evenement/places/", params: idEvent);
    // final response = await getData(url: urlData);
    // final List body = jsonDecode(response.body);
    print('====================RESPONSE ===================================');
    print(urlData);
  }
}
