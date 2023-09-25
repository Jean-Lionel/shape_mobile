import 'package:flutter/material.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: 'Changer le mot de passe',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: defaultDecoration("Mot de passe actuel"),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: defaultDecoration("Nouveau mot de passe"),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration:
                  defaultDecoration("Confirmer le nouveau mot de passe"),
            ),
            const SizedBox(height: 20.0),
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
