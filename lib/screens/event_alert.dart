import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
import 'package:shapp/models/places.dart';
import 'package:shapp/screens/event_place_categorie.dart';
import 'package:shapp/widgets/form_model.dart';

class EventAlert extends StatefulWidget {
  final Evenement event;
  const EventAlert(this.event, {super.key});

  @override
  State<EventAlert> createState() => _EventAlertState();
}

class _EventAlertState extends State<EventAlert> {
  Map selectedRow = {};

  @override
  void initState() {
    // TODO: implement initState
    print("================================");
    print(widget.event);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Place>> _placesListe = Place.getPlaces(widget.event.id);
    return FormModel(
        title: "SMS ALERT",
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Catégories de places',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            FutureBuilder(
                future: _placesListe,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // do something till waiting for data, we can show here a loader
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    // we have the data, do stuff here
                    final places = snapshot.data!;

                    return displayPlacesB(context, places, widget.event);
                    // EventCard();
                    // buildEvents(events);
                  } else {
                    // we did not recieve any data, maybe show error or no data available
                    return Text("Error :");
                  }
                }),
          ],
        ));
  }
}

class SelectableChip extends StatefulWidget {
  const SelectableChip(
      {super.key, required this.label, required this.onChange});

  final String label;
  final void Function(bool) onChange;

  @override
  State<SelectableChip> createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onChange(isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color:
              isSelected ? theme.colorScheme.secondary : theme.highlightColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          widget.label,
          style: theme.textTheme.titleMedium!.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget displayPlacesB(context, places, event) {
  Map selectedRow = {};
  return Column(
    children: [
      ...List.generate(
        places.length,
        (index) => ExpansionTile(
          title: Text(' ${places[index].nomPlace}'),
          childrenPadding: const EdgeInsets.all(0.0),
          tilePadding: const EdgeInsets.all(0.0),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SelectableChip(
                    label: 'SMS',
                    onChange: (value) {},
                  ),
                  const VerticalDivider(),
                  const VerticalDivider(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: const Text("Envoyer"),
                  ),
                ],
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                checkboxHorizontalMargin: 16,
                horizontalMargin: 0.0,
                showCheckboxColumn: true,
                columns: const [
                  DataColumn(
                      label: Text(
                    "Nom et Prénom",
                    softWrap: true,
                  )),
                  DataColumn(
                      label: Text(
                    "Téléphone",
                    softWrap: true,
                  ))
                ],
                rows: List.generate(
                  10,
                  (index) => DataRow(
                    selected: selectedRow[index] == true,
                    onSelectChanged: (state) {
                      print('================================');
                    },
                    cells: const [
                      DataCell(Text('Yohan Pele')),
                      DataCell(Text('+237 253 718 618')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ).toList(),
    ],
  );
}
