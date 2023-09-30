class User {
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
}
