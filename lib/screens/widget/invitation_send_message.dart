import 'package:flutter/material.dart';
import 'package:shapp/models/evenement.dart';
import 'package:shapp/models/invitation.dart';
import 'package:shapp/models/places.dart';
import 'package:shapp/screens/event_alert.dart';

class SendMessageInvitation extends StatefulWidget {
  final Evenement? event;
  final places;
  const SendMessageInvitation({this.places, this.event, super.key});

  @override
  State<SendMessageInvitation> createState() => _SendMessageInvitationState();
}

class _SendMessageInvitationState extends State<SendMessageInvitation> {
  List invitations = [];

  String query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeInvitations();
  }

  initializeInvitations() async {
    // final x = await Invitation.getInvitation(widget.place?.id);
    // setState(() {
    //   invitations = x;
    // });
  }

  TextEditingController textMessageController = TextEditingController();
  int tailleMessageCount = 0;

  @override
  Widget build(BuildContext context) {
    Map selectedRow = {};
    return Column(
      children: [
        ...List.generate(
          4,
          (index) => ExpansionTile(
            title: Text(' ${widget.places[index].nomPlace}'),
            childrenPadding: const EdgeInsets.all(0.0),
            tilePadding: const EdgeInsets.all(0.0),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
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
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              TextField(
                controller: textMessageController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              Text("${tailleMessageCount}/160"),
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
                        selectedRow[index] = state;
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
}
