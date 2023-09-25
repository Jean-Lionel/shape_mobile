import 'package:flutter/material.dart';
import 'package:shapp/widgets/form_model.dart';

class EventAlert extends StatefulWidget {
  const EventAlert({super.key});

  @override
  State<EventAlert> createState() => _EventAlertState();
}

class _EventAlertState extends State<EventAlert> {
  Map selectedRow = {};

  @override
  Widget build(BuildContext context) {
    return FormModel(
        title: "SMS/MAIL ALERT",
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Catégories de places',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            ...List.generate(
              4,
              (index) => ExpansionTile(
                title: Text('Categorie ${index + 1}'),
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
                        SelectableChip(
                          label: 'EMAIL',
                          onChange: (value) {},
                        ),
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
                        )),
                        DataColumn(
                            label: Text(
                          "Email",
                          softWrap: true,
                        )),
                      ],
                      rows: List.generate(
                        10,
                        (index) => DataRow(
                          selected: selectedRow[index] == true,
                          onSelectChanged: (state) {
                            setState(() {
                              selectedRow[index] = state;
                            });
                          },
                          cells: const [
                            DataCell(Text('Yohan Pele')),
                            DataCell(Text('+237 253 718 618')),
                            DataCell(Text('nbkassumanidi@gmail.com')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).toList(),
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
            color:  isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
