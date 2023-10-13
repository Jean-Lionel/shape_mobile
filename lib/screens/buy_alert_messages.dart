import 'package:flutter/material.dart';
import 'package:shapp/models/mobile_credit.dart';
import 'package:shapp/models/userProfile.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class BuyAlertMessages extends StatefulWidget {
  const BuyAlertMessages({super.key});

  @override
  State<BuyAlertMessages> createState() => _BuyAlertMessagesState();
}

class _BuyAlertMessagesState extends State<BuyAlertMessages> {
  final _formKey = GlobalKey<FormState>();

  late List payoutMethods = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeListe();
  }

  void initializeListe() async {
    final x = await MobileCredit.payoutMethods();
    setState(() {
      payoutMethods = x;
    });
  }

  Map? currentPM;
  double price = 0.0;
  TextEditingController transactionController = new TextEditingController();

  void saveBuyMessage() async {
    final resp = await UserProfile.saveMessage(
        transactionController.text, currentPM!["name"], price);
    print("================================");
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: "Acheter de messages d'alert",
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField(
              isExpanded: true,
              decoration: defaultDecoration("Methode de paiment"),
              items: payoutMethods
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text('${e['name']}'),
                      ))
                  .toList(),
              onChanged: (payout) {
                setState(() {
                  currentPM = payout as Map?;
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
              controller: transactionController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration:
                  defaultDecoration("Numéro de la transaction").copyWith(
                helperText: "Le numéro de la transaction après retrait",
              ),
            ),
            const SizedBox(height: 20.0),
            Button(
              label: 'Acheter',
              onTap: () {
                saveBuyMessage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
