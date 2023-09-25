import 'package:flutter/material.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool wantToEdit = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: 'Mon compte',
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (wantToEdit) ...[
            TextButton.icon(
              onPressed: () {
                setState(() {
                  wantToEdit = !wantToEdit;
                });
              },
              icon: const Icon(Icons.cancel),
              label: const Text('Annuler'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: defaultDecoration("Prénom"),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: defaultDecoration("Nom de famille"),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: defaultDecoration("Email (Facultatif)"),
                  ),
                  const SizedBox(height: 10.0),
                  Button(
                    label: 'Enregistrer',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ] else ...[
            TextButton.icon(
              onPressed: () {
                setState(() {
                  wantToEdit = !wantToEdit;
                });
              },
              icon: const Icon(Icons.edit),
              label: const Text('Modifier'),
            ),
            itemTile(
              context,
              "Prénom et Nom de famille",
              "Ditho Malipo",
              Icons.person_2,
            ),
            itemTile(
              context,
              "Email",
              "dithoney@gmail.com",
              Icons.email,
            ),
            itemTile(
              context,
              "Nom d'utilisateur",
              "dithoney",
              Icons.text_format,
            ),
            itemTile(
              context,
              "Numéro de téléphone",
              "+257 62670198",
              Icons.phone,
            ),
            itemTile(
              context,
              "Pays",
              "Burundi",
              Icons.language,
            ),
          ],
        ],
      ),
    );
  }

  Widget itemTile(
    BuildContext context,
    String label,
    String subtitle,
    IconData icon,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(subtitle),
    );
  }
}
