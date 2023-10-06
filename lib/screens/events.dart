import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
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
    Future<List<Evenement>> _eventsFuture = Evenement.getEvenemts();
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
          Container(
            child: FutureBuilder(
              // pass the list (postsFuture)
              future: _eventsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // do something till waiting for data, we can show here a loader
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  // we have the data, do stuff here
                  final events = snapshot.data!;

                  return Column(
                    children: [
                      ...events.map((e) => EventCard(e)).toList(),
                    ],
                  );
                  // EventCard();
                  // buildEvents(events);
                } else {
                  // we did not recieve any data, maybe show error or no data available
                  return Text("Error :");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  Evenement event;
  EventCard(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: event.logoImage != null
            ? CircleAvatar(child: Text('X'))
            : CircleAvatar(child: Text('E')),
        title: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${event.nomEvenement} VENT"),
              Text("${event.eventTime} "),
            ],
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(
              width: 5,
            ),
            Text('${event.adresseEvenement} '),
          ],
        ),
        trailing: Icon(Icons.qr_code),
      ),
    );
  }
}

Widget buildEvents(List<Evenement> evenements) {
  print("================================================");
  print(evenements);
  return ListView.builder(
    itemCount: evenements.length,
    itemBuilder: (context, index) {
      final event = evenements[index];
      return EventCard(event);
    },
  );
}
