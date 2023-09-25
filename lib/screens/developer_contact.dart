import 'package:flutter/material.dart';

class DeveloperContacts extends StatelessWidget {
  const DeveloperContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar( pinned: true,
            title: Text('Contactez-nous'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  contactItem(
                    context,
                    Icons.call,
                    "Appelez-nous",
                    "Lun-Ven de 8:00' à 17:00'",
                    "+1 689 267 4454 (WhatsApp) or +243 992 135 981",
                  ),
                  const Divider(),
                  contactItem(
                    context,
                    Icons.email,
                    "Envoyez-nous un e-mail",
                    "Parlez à notre équipe amicale",
                    "info-shapp@dewiya.online",
                  ),
                  const Divider(),
                  contactItem(
                    context,
                    Icons.location_pin,
                    "Rendez nous visite",
                    "Visitez notre bureau",
                    "16 Boulevard Sendwe, C /Kalamu, Congo-Kinshasa",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contactItem(BuildContext context, IconData icon, String action,
      String subtitle, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: IconButton(onPressed: () {}, icon: Icon(icon)),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            title: Text(action),
            subtitle: Text(subtitle),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
