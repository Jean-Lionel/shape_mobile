import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
import 'package:shapp/models/places.dart';
import 'package:shapp/screens/_lib.dart';

class EventDetails extends StatelessWidget {
  final Evenement event;
  const EventDetails(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Place>> _placesListe = Place.getPlaces(event.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Details de l'événement"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CreateEvent(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    image: DecorationImage(
                      image: NetworkImage(event.getImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.25),
                          const SizedBox(height: 20.0),
                          Text(
                            '${event.nomEvenement}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const EventAlert(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.sms),
                        label: const Text('SMS/MAIL ALERT'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text('Date'),
                        subtitle: Text("${event.dateEvenement}"),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text('Heure'),
                        subtitle: Text("${event.heureEvenement}'"),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Adresse de l'événement"),
                        subtitle: Text('${event.adresseEvenement}'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Email du responsable"),
                        subtitle: Text('${event.emailResponsable}'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Premier Contact"),
                        subtitle: Text('${event.numeroContact1}'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Deuxième Contact"),
                        subtitle: Text('${event.numeroContact2}'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text('Description'),
                        subtitle: Text('${event.autresInfos}'),
                      ),
                      FutureBuilder(
                          future: _placesListe,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // do something till waiting for data, we can show here a loader
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              // we have the data, do stuff here
                              final places = snapshot.data!;

                              return displayPlaces(context, places);
                              // EventCard();
                              // buildEvents(events);
                            } else {
                              // we did not recieve any data, maybe show error or no data available
                              return Text("Error :");
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget displayPlaces(context, places) {
  return Column(
    children: [
      ExpansionTile(
        tilePadding: const EdgeInsets.all(0.0),
        childrenPadding: const EdgeInsets.all(0.0),
        title: const Text('Catégories de places'),
        children: List.generate(
          places.length,
          (index) => ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => EventPlaceCategorie(places[index])),
              );
            },
            contentPadding: const EdgeInsets.all(0.0),
            title: Text('${places[index].nomPlace}'),
            subtitle: Text('${places[index].nombre} invitations'),
            trailing: const Icon(Icons.arrow_forward_outlined),
          ),
        ).toList(),
      ),
    ],
  );
}
