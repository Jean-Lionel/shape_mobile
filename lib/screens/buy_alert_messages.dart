import 'package:flutter/material.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class BuyAlertMessages extends StatefulWidget {
  const BuyAlertMessages({super.key});

  @override
  State<BuyAlertMessages> createState() => _BuyAlertMessagesState();
}

class _BuyAlertMessagesState extends State<BuyAlertMessages> {
  final _formKey = GlobalKey<FormState>();

  final payoutMethods = [
    {
      "name": "Vodacom MPESA",
      "code": "376871",
      "code-name": "DEWIYA TECH",
    },
    {
      "name": "Airtel Money",
      "code": "098309",
      "code-name": "DEWIYA TECH",
    },
    {
      "name": "Orange Money",
      "code": "198372",
      "code-name": "DEWIYA TECH",
    },
  ];

  Map? currentPM;
  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: "Acheter de messages d'alert",
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField(isExpanded: true,
              decoration: defaultDecoration("Methode de paiment"),
              items: payoutMethods
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text('${e['name']}'),
                      ))
                  .toList(),
              onChanged: (payout) {
                setState(() {
                  currentPM = payout;
                });
              },
            ),
            if (currentPM != null && currentPM!.isNotEmpty) ...[
              const SizedBox(height: 10.0),
              Card(
                child: ListTile(
                  title: Text(currentPM!['code-name']),
                  subtitle: Text("CODE AGENT ${currentPM!['code']}"),
                ),
              ),
            ],
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: defaultDecoration("Nombre de messages"),
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  setState(() {
                    price = double.parse(value);
                  });
                }
              },
            ),
            const SizedBox(height: 10.0),
            Card(
              child: ListTile(
                title: Text("\$ ${(price * 0.5).toStringAsFixed(1)}"),
                subtitle: const Text('\$ 0.5 par message'),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  defaultDecoration("Numéro de la transaction").copyWith(
                helperText: "Le numéro de la transaction après retrait",
              ),
            ),
            const SizedBox(height: 20.0),
            Button(
              label: 'Acheter',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
