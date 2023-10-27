import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
import 'package:shapp/models/invitation.dart';
import 'package:shapp/models/places.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class EventPlaceCategorie extends StatefulWidget {
  final Place place;
  final Evenement event;
  const EventPlaceCategorie(this.place, this.event, {super.key});
  @override
  State<EventPlaceCategorie> createState() => _EventPlaceCategorieState();
}

class _EventPlaceCategorieState extends State<EventPlaceCategorie> {
  List invitations = [];

  String query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeInvitations();
  }

  initializeInvitations() async {
    final x = await Invitation.getInvitation(widget.place.id);
    setState(() {
      invitations = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    Place p = widget.place;
    final canAdd = invitations.length < int.parse(p.nombre);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('${p.nomPlace as String}'),
            actions: [],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Text(
                      "${invitations.length}/ ${int.parse(p.nombre)} invitations",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: TextButton.icon(
                      onPressed: canAdd
                          ? () {
                              showDialog(
                                context: context,
                                builder: (context) => CreateInvitation(
                                  place: p,
                                  evenementId: widget.event,
                                  updateInterfaces: () {
                                    initializeInvitations();
                                  },
                                  totalInvitations: invitations.length,
                                ),
                              ).then((value) {
                                if (value == true) {
                                  setState(() {
                                    invitations.add(invitations.length + 1);
                                  });
                                }
                              });
                            }
                          : null,
                      icon: const Icon(Icons.add),
                      label: const Text("Ajouter"),
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: defaultDecoration("Filtrer par nom d'invité"),
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ...invitations.map(
                    (e) => ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CardDetails(e),
                        ));
                      },
                      contentPadding: const EdgeInsets.all(0.0),
                      title: Text(" ${e.nomInvite}  ${e.prenomInvite}"),
                      subtitle: Text("${e.nombreInvites} personnes"),
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        child: SfBarcodeGenerator(
                          value: '${e.qrCodes}',
                          symbology: QRCode(),
                          showValue: false,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            invitations.removeAt(invitations.indexOf(e));
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateInvitation extends StatefulWidget {
  final Place place;
  final dynamic evenementId;
  final dynamic totalInvitations;
  final Function() updateInterfaces;
  const CreateInvitation(
      {required this.updateInterfaces,
      required this.place,
      this.evenementId,
      this.totalInvitations,
      super.key});

  @override
  State<CreateInvitation> createState() => _CreateInvitationState();
}

class _CreateInvitationState extends State<CreateInvitation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController personneController = TextEditingController();
  TextEditingController emailContoller = TextEditingController();

  saveInvitation() async {
    if (_formKey.currentState!.validate()) {
      var bodyRequest = {
        "prenomInvite": prenomController.text,
        "nomInvite": nomController.text,
        "phoneNumber": telephoneController.text,
        "mailInvite": emailContoller.text,
        "nombreInvites": personneController.text,
      };

      try {
        final response = await Place.savePersonToInvitation(bodyRequest,
            widget.place.id, widget.evenementId.id, widget.totalInvitations);
        if (response) {
          widget.updateInterfaces();
          Navigator.of(context).pop(true);
        }
      } catch (e) {
        final snackBar = SnackBar(
          content: Text('${e}'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              // Some code to undo the change.
              Navigator.of(context).pop(true);
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enregistrer une invitation"),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nomController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: defaultDecoration("Nom"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nom est obligatoire';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: prenomController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: defaultDecoration("Prénom"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Prénom est obligatoire';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: telephoneController,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  decoration: defaultDecoration("Téléphone"),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: emailContoller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: defaultDecoration("Email"),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: personneController,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.words,
                  decoration: defaultDecoration("Personnes autorisées"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'le nombre de personne est obligatoire';
                    }
                    return null;
                  },
                ),
                const Divider(),
                Button(
                  label: 'Enregistrer',
                  onTap: () {
                    saveInvitation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
