import 'dart:convert';

import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';

class Invitation {
  dynamic id;
  dynamic prenomInvite;
  dynamic nomInvite;
  dynamic phoneNumber;
  dynamic mailInvite;
  dynamic nombreInvites;
  dynamic idInvitation;
  dynamic qrCodes;
  dynamic link;
  dynamic etat;
  dynamic etatLink;
  dynamic dateValidateLink;
  dynamic dateModification;
  dynamic dateCreation;
  dynamic place;

  Invitation.fromJson(dynamic json)
      : this.id = json['id'],
        this.prenomInvite = json['prenomInvite'],
        this.nomInvite = json['nomInvite'],
        this.phoneNumber = json['phoneNumber'],
        this.mailInvite = json['mailInvite'],
        this.nombreInvites = json['nombreInvites'],
        this.idInvitation = json['idInvitation'],
        this.qrCodes = json['qrCodes'],
        this.link = json['link'],
        this.etat = json['etat'],
        this.etatLink = json['etatLink'],
        this.dateValidateLink = json['dateValidateLink'],
        this.dateModification = json['dateModification'],
        this.dateCreation = json['dateCreation'],
        this.place = json['place'];

  static Future<List<Invitation>> getInvitation(var idPlaces) async {
    final urlData = makeUrl("view/invitations/", params: idPlaces);
    final response = await getData(url: urlData);
    final List body = jsonDecode(response.body);

    print(
        "==========================${response.statusCode}======================================");
    print(response.body);
    return body.map((e) => Invitation.fromJson(e)).toList();
  }
}
