import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
import 'package:shapp/models/mobile_credit.dart';
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
    MobileCredit.getAllCredits();
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
  final Evenement event;
  const EventCard(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EventDetails(event),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: event.logoImage != null
              ? const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://hips.hearstapps.com/hmg-prod/images/wedding-wishes-1645634516.jpg?crop=1xw:0.8429543847241867xh;center,top"))
              : CircleAvatar(
                  backgroundImage: NetworkImage(event.getImage),
                ),
          title: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${event.nomEvenement}"),
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
          //trailing: Icon(Icons.qr_code),
          trailing: Column(
            children: [
              IconButton(
                onPressed: () {
                  Evenement.updateStatus(event.id);
                },
                icon: Icon(
                  Icons.edit,
                  size: 26,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildEvents(List<Evenement> evenements) {
  return ListView.builder(
    itemCount: evenements.length,
    itemBuilder: (context, index) {
      final event = evenements[index];
      return EventCard(event);
    },
  );
}
