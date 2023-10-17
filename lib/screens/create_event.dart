import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shapp/config/routes/routes.dart';
import 'package:shapp/config/shared_preference/shared_preference_data.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';
import 'package:http/http.dart' as http;

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController typeEvenement = TextEditingController();
  TextEditingController nomEvenement = TextEditingController();
  TextEditingController dateEvenement = TextEditingController();
  TextEditingController heureEvenement = TextEditingController();
  TextEditingController dateFinEvenement = TextEditingController();
  TextEditingController heureFinEvenement = TextEditingController();
  TextEditingController adresseEvenement = TextEditingController();
  TextEditingController emailResponsable = TextEditingController();
  TextEditingController numeroContact1 = TextEditingController();
  TextEditingController numeroContact2 = TextEditingController();
  TextEditingController places = TextEditingController();
  TextEditingController autresInfos = TextEditingController();
  TextEditingController file = TextEditingController();

  Map? currentPM;
  double price = 0.0;
  final _timeController = TextEditingController();
  final _timeEndController = TextEditingController();

  bool isLoading = false;
  //Nininahazwe Jean Lionel Je suis en bonne

  String convertDate(String d) {
    //10/16/2023, => 2023-10-16
    var myDate = d.split("/");

    String curent = "${myDate[2]}-${myDate[0]}-${myDate[1]}";

    return myDate.isNotEmpty ? curent : "";
  }

  dynamic listPlaces;
  void _findCategories(var items) {
    setState(() {
      listPlaces = items;
    });
  }

  Future<void> saveEvent() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest("POST", SAVE_EVENT_DATA);
      request.fields["nomEvenement"] = nomEvenement.text;
      request.fields["dateEvenement"] = convertDate(dateEvenement.text);
      request.fields["heureEvenement"] = _timeController.text;
      request.fields["dateFinEvenement"] = convertDate(dateFinEvenement.text);
      request.fields["heureFinEvenement"] = _timeEndController.text;
      request.fields["adresseEvenement"] = adresseEvenement.text;
      request.fields["emailResponsable"] = emailResponsable.text;
      request.fields["numeroContact1"] = numeroContact1.text;
      request.fields["numeroContact2"] = numeroContact2.text;
      request.fields["typeEvenement"] = "Prive";
      request.fields["autresInfos"] = autresInfos.text;

      String items = "";
      for (var place in listPlaces) {
        items += "${place['key']}#${place['value']},";
      }
      print("================================================================");
      print(items);
      request.fields['places'] = items;

      var token = UserSimplePeference.getToken();
      request.headers
          .addAll(<String, String>{'Authorization': 'Bearer $token'});

      try {
        var response = await http.Response.fromStream(await request.send());

        print("===========${response.statusCode}===============");

        if (response.statusCode >= 200 && response.statusCode < 300) {
          var jsonResponse = json.decode(response.body);
          print("Evenement créé avec succès");

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Création de l\'évenemenet avec succès Data')),
          );
        } else {
          // Handle error or refresh logic
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error : ${response.body}')),
          );
        }
      } catch (error) {
        // Handle error
      }
      setState(() {
        isLoading = false;
      });
    }

    //return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: 'Nouveau événement',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nomEvenement,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Nom de l'événement"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Le nom de l'événement est obligatoire";
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: DateTimeField(
                    controller: dateEvenement,
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Date debut"),
                    onShowPicker: (context, currentValue) => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DateTimeField(
                    controller: dateFinEvenement,
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Date fin"),
                    onShowPicker: (context, currentValue) => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: DateTimeField(
                    controller: _timeController,
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Heure debut"),
                    onShowPicker: (context, currentValue) => showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(() {
                            _timeController.text =
                                "${value.hour}:${value.minute}";
                          });
                          return DateFormat.jm()
                              .parse(value.format(context).toString());
                        } else {
                          setState(() {
                            _timeController.clear();
                          });
                          return DateTime.now();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DateTimeField(
                    controller: _timeEndController,
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Heure fin"),
                    onShowPicker: (context, currentValue) => showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          _timeEndController.text =
                              "${value.hour}:${value.minute}";
                        });
                        return DateFormat.jm()
                            .parse(value.format(context).toString());
                      } else {
                        setState(() {
                          _timeEndController.clear();
                        });
                        return DateTime.now();
                      }
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: adresseEvenement,
              keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Adresse de l'événement"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: emailResponsable,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Email du responsable"),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: numeroContact1,
                    keyboardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    decoration: defaultDecoration("Premier contact"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: numeroContact2,
                    keyboardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    decoration: defaultDecoration("Deuxième contact"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: autresInfos,
              maxLines: 5,
              decoration: defaultDecoration("Texte de l'invitation"),
            ),
            const SizedBox(height: 10.0),
            KeyValueInput(
              headers: [],
              label: "Catégories de place",
              findValue: (e) {
                _findCategories(e);
              },
            ),
            const SizedBox(height: 10.0),
            isLoading
                ? CircularProgressIndicator()
                : Button(
                    label: 'Enregistrer',
                    onTap: () {
                      saveEvent();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class KeyValueInput extends StatefulWidget {
  const KeyValueInput(
      {Key? key,
      required this.headers,
      required this.label,
      required this.findValue})
      : super(key: key);

  final List<Map<String, dynamic>> headers;
  final String label;
  final Function(dynamic v) findValue;
  @override
  State<KeyValueInput> createState() => KeyValueInputState();
}

class KeyValueInputState extends State<KeyValueInput> {
  List<Map<String, dynamic>> headers = [];

  @override
  void initState() {
    if (widget.headers.isNotEmpty) {
      headers = widget.headers;
      widget.findValue(headers);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          title: Text(widget.label),
          trailing: TextButton.icon(
            onPressed: () {
              setState(() {
                headers.add({});
              });
            },
            icon: const Icon(Icons.add),
            label: const Text("Ajouter"),
          ),
        ),
        ...headers.map(
          (e) {
            final index = headers.indexOf(e);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _HeadersInput(
                      name: e['name'],
                      amount: e['amount'],
                      onChange: (hea) {
                        setState(() {
                          headers.fillRange(index, index + 1, hea);
                          widget.findValue(headers);
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        headers.removeAt(index);
                        widget.findValue(headers);
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  List<Map<String, dynamic>> getHeaders() => headers;
}

class _HeadersInput extends StatefulWidget {
  const _HeadersInput({
    Key? key,
    this.name,
    this.amount,
    required this.onChange,
  }) : super(key: key);
  final String? name;
  final int? amount;
  final void Function(Map<String, dynamic> header) onChange;

  @override
  State<_HeadersInput> createState() => _HeadersInputState();
}

class _HeadersInputState extends State<_HeadersInput> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  int? amount;

  @override
  void initState() {
    name = widget.name;
    amount = widget.amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: name,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              decoration: defaultDecoration("Nom"),
              onChanged: (value) {
                widget.onChange({"key": value, "value": amount});
                setState(() {
                  name = value;
                });
              },
              validator: (value) => stringValidator(context, value: value),
              onFieldSubmitted: (value) {
                _formKey.currentState!.validate();
              },
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: TextFormField(
              initialValue: "${amount ?? 0}",
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              decoration: defaultDecoration("Nombre"),
              validator: (value) => stringValidator(context, value: value),
              onChanged: (value) {
                widget.onChange({"key": name, "value": value});
                setState(() {
                  amount = int.tryParse(value) ?? 0;
                });
              },
              onFieldSubmitted: (value) {
                _formKey.currentState!.validate();
              },
            ),
          ),
        ],
      ),
    );
  }
}
