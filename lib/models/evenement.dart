import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class Evenement {
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
  });

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
}
