import 'package:flutter/material.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: "Centre d'aide",
      form: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField(isExpanded: true,
                
                decoration: defaultDecoration("Fonctionnalité").copyWith(
                  helperText:
                      "Choisissez la fonctionnalité à l'origine du problème.",
                ),
                items: [
                  "Créer un évenement",
                  "Acheter du crédit",
                  "Enregister une invitation",
                  "Partager une invitation",
                  "Mettre à jour les informations utilisateur",
                  "Modifier le mot de passe",
                  "Modifier le numéro de téléphone",
                  "Envoyer des SMS d'alert",
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (payout) {},
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                maxLines: 6,
                decoration: defaultDecoration(
                  "Description",
                ).copyWith(
                  helperText: "Décrivez le problème que vous rencontrez",
                ),
              ),
              const SizedBox(height: 10.0),
              Button(
                label: 'Envoyer',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
