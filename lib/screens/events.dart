import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: "Evénements",
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: defaultDecoration("Filtrer par nom d'événement"),
            onChanged: (value) {
              // setState(() {
              //   query = value;
              // });
            },
          ),
          const SizedBox(height: 24.0),
          const Column(
            children: [
              EventCard(),
            ],
          )
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(child: Text('B')),
        title: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Headline'),
              Text('2023-12-06 06:30'),
            ],
          ),
        ),
        subtitle: Text('Longer supporting '),
        trailing: Icon(Icons.qr_code),
      ),
    );
  }
}
