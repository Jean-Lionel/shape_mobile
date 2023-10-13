import 'package:flutter/material.dart';
import 'package:shapp/models/mobile_credit.dart';
import 'package:shapp/models/userProfile.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class BuyCredit extends StatefulWidget {
  const BuyCredit({super.key});

  @override
  State<BuyCredit> createState() => _BuyCreditState();
}

class _BuyCreditState extends State<BuyCredit> {
  final _formKey = GlobalKey<FormState>();

  late List payoutMethods = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeListe();
  }

  void initializeListe() async {
    payoutMethods = await MobileCredit.payoutMethods();
  }

  Map? currentPM;
  double price = 0.0;
  TextEditingController transactionController = new TextEditingController();

  void saveInformations() async {
    final resp = await UserProfile.saveCredit(
        transactionController.text, currentPM!["name"], price);

    if (resp != null) {
      final snackBar = SnackBar(
        content: Text(resp),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    MobileCredit.payoutMethods();
    return FormModel(
      title: 'Acheter de crédits',
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
              decoration: defaultDecoration("Nombre de crédits"),
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
                subtitle: const Text('\$ 0.5 par crédit'),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  defaultDecoration("Numéro de la transaction").copyWith(
                helperText: "Le numéro de la transaction après retrait",
              ),
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  setState(() {
                    transactionController.text = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20.0),
            Button(
              label: 'Acheter',
              onTap: () {
                saveInformations();
              },
            ),
          ],
        ),
      ),
    );
  }
}
