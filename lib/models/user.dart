import 'package:http/http.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class User {
  int? id;
  String? nom;
  String? prenom;
  String? telephone;
  String? adresseMail;
  String? typeCompte;
  dynamic idAgent;
  String? codePays;
  String? genre;
  String? dateNaissance;
  String? photoProfil;
  String? statut;
  String? username;
  String? roles;
  dynamic appRoles;
  String? dateModification;
  String? dateCreation;

  User({
    this.id,
    this.nom,
    this.prenom,
    this.telephone,
    this.adresseMail,
    this.typeCompte,
    this.idAgent,
    this.codePays,
    this.genre,
    this.dateNaissance,
    this.photoProfil,
    this.statut,
    this.username,
    this.roles,
    this.appRoles,
    this.dateModification,
    this.dateCreation,
  });

  User.fromJson(dynamic json)
      : this.id = json["id"] ?? 0,
        this.nom = json["nom"] ?? "",
        this.prenom = json["prenom"] ?? "",
        this.telephone = json["telephone"] ?? "",
        this.adresseMail = json["adresseMail"] ?? "",
        this.typeCompte = json["typeCompte"] ?? "",
        this.idAgent = json["idAgent"],
        this.codePays = json["codePays"] ?? "",
        this.genre = json["genre"] ?? "",
        this.dateNaissance = json["dateNaissance"] ?? "",
        this.photoProfil = json["photoProfil"] ?? "",
        this.statut = json["statut"] ?? "",
        this.username = json["username"] ?? "",
        this.roles = json["roles"] ?? "",
        this.appRoles = json["appRoles"] ?? "",
        this.dateModification = json["dateModification"] ?? "",
        this.dateCreation = json["dateCreation"] ?? "";

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
