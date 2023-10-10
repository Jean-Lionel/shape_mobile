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
  const EventPlaceCategorie(this.place, {super.key});
  @override
  State<EventPlaceCategorie> createState() => _EventPlaceCategorieState();
}

class _EventPlaceCategorieState extends State<EventPlaceCategorie> {
  List invitations = [];

  String query = '';

  @override
  Widget build(BuildContext context) {
    Place p = widget.place;
    Invitation.getInvitation(p.id);
    final canAdd = invitations.length < int.parse(p.nombre);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text("Categorie 1"),
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
                      "${invitations.length}/10 invitations",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: TextButton.icon(
                      onPressed: canAdd
                          ? () {
                              showDialog(
                                context: context,
                                builder: (context) => const CreateInvitation(),
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
                          builder: (_) => const CardDetails(),
                        ));
                      },
                      contentPadding: const EdgeInsets.all(0.0),
                      title: const Text("Famille Bagule Nestor"),
                      subtitle: const Text("2 personnes"),
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        child: SfBarcodeGenerator(
                          value: 'NXNF8_aetz',
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
  const CreateInvitation({super.key});

  @override
  State<CreateInvitation> createState() => _CreateInvitationState();
}

class _CreateInvitationState extends State<CreateInvitation> {
  final _formKey = GlobalKey<FormState>();
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
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: defaultDecoration("Nom"),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: defaultDecoration("Prénom"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  decoration: defaultDecoration("Téléphone"),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: defaultDecoration("Email"),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.words,
                  decoration: defaultDecoration("Personnes autorisées"),
                ),
                const Divider(),
                Button(
                  label: 'Enregistrer',
                  onTap: () {
                    Navigator.of(context).pop(true);
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
