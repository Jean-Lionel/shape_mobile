import 'package:http/http.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class User {
  String? nom;
  String? prenom;
  String? adresseMail;
  String? telephone;
  String? username;
  String? password;

  String? access_token;
  String? quantite_credit;
  String? quantite_evenement;
  int? id;
  String? code_pays;
  String? quantite_credit_sms;

  User({
    this.username,
    this.password,
    this.access_token,
    this.quantite_credit,
    this.quantite_evenement,
    this.id,
    this.code_pays,
    this.quantite_credit_sms,
  });

  User.fromJson(dynamic json)
      : this.id = json['id'],
        this.username = json['username'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['id'] = this.id;
    return data;
  }

  static Future<String> userProfile() async {
    final response = await getData(url: USER_PROFILE);
    // var x = {
    //   "id": 2,
    //   "nom": "TCHEUSI",
    //   "prenom": "Lisa",
    //   "telephone": "+16892674454",
    //   "adresseMail": "lz@shappu.com",
    //   "typeCompte": "Standard",
    //   "idAgent": 0,
    //   "codePays": "+1",
    //   "genre": null,
    //   "dateNaissance": null,
    //   "photoProfil": null,
    //   "statut": "VALIDE",
    //   "username": "liza",
    //   "roles": "USER",
    //   "appRoles": [
    //     {"id": 1, "roleName": "USER"}
    //   ],
    //   "dateModification": null,
    //   "dateCreation": "2023-09-30T15:02:01.6661"
    // };

    return response.body;
  }
}
