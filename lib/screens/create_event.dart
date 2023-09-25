import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();

  final payoutMethods = [
    {
      "name": "Vodacom MPESA",
      "code": "376871",
      "code-name": "DEWIYA TECH",
    },
    {
      "name": "Airtel Money",
      "code": "098309",
      "code-name": "DEWIYA TECH",
    },
    {
      "name": "Orange Money",
      "code": "198372",
      "code-name": "DEWIYA TECH",
    },
  ];

  Map? currentPM;
  double price = 0.0;
  final _timeController = TextEditingController();
  final _timeEndController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: 'Nouveau événement',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Nom de l'événement"),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: DateTimeField(
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Date debut"),
                    onShowPicker: (context, currentValue) => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 130),
                      lastDate: DateTime.now(),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DateTimeField(
                    format: DateFormat.yMd(Platform.localeName),
                    decoration: defaultDecoration("Date fin"),
                    onShowPicker: (context, currentValue) => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 130),
                      lastDate: DateTime.now(),
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
                    ).then((value) {
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
                    }),
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
              keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Adresse de l'événement"),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              decoration: defaultDecoration("Email du responsable"),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    decoration: defaultDecoration("Premier contact"),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    decoration: defaultDecoration("Deuxième contact"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            FormBuilderFilePicker(
              name: "Selectionner l'image",
              decoration: defaultDecoration("Selectionner l'image"),
              withData: true,
              allowMultiple: false,
              previewImages: true,
              onChanged: (val) {},
              onSaved: (value) {},
              onFileLoading: (val) {},
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              maxLines: 5,
              decoration: defaultDecoration("Texte de l'invitation"),
            ),
            const SizedBox(height: 10.0),
            const KeyValueInput(
              headers: [],
              label: "Catégories de place",
            ),
            const SizedBox(height: 10.0),
            Button(
              label: 'Enregistrer',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class KeyValueInput extends StatefulWidget {
  const KeyValueInput({Key? key, required this.headers, required this.label})
      : super(key: key);

  final List<Map<String, dynamic>> headers;
  final String label;
  @override
  State<KeyValueInput> createState() => KeyValueInputState();
}

class KeyValueInputState extends State<KeyValueInput> {
  List<Map<String, dynamic>> headers = [];

  @override
  void initState() {
    if (widget.headers.isNotEmpty) {
      headers = widget.headers;
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
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        headers.removeAt(index);
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
