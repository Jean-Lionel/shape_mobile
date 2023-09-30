import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void logOUtConnetedUser(contxt) {
    Navigator.of(contxt).pushReplacementNamed(Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: true,
            automaticallyImplyLeading: false,
            title: Text("Paramètres"),
          ),
          const SliverToBoxAdapter(child: SpendLess()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  itemTile(
                    context,
                    "Mon compte",
                    Icons.person,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MyAccount(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Réinitialiser le mot de passe",
                    Icons.password,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangePassword(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Changer le numéro de téléphone",
                    Icons.phone,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangePhoneNumber(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Politiques de confidentialité",
                    Icons.privacy_tip,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PrivacyPolicies(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Centre d'aide",
                    Icons.help_outline_outlined,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const HelpCenter(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Nos contacts",
                    Icons.call,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const DeveloperContacts(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "A propose de l'application",
                    Icons.info,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AboutTheApp(),
                        ),
                      );
                    },
                  ),
                  itemTile(
                    context,
                    "Déconnexion",
                    Icons.logout,
                    () {
                      logOUtConnetedUser(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemTile(
    BuildContext context,
    String label,
    IconData icon,
    void Function() onTap,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      onTap: onTap,
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
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
