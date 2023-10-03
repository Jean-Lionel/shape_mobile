import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapp/config/routes/routes.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key, required this.onSuccess});

  final void Function() onSuccess;

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  Map? currentCountry;
  TextEditingController phoneNumberController = new TextEditingController();
  bool otpSent = false;
  bool isVerfiedNumber = false;
  String currentNumber = "";
  String currentCode = "";

  void verfierCode(otp) async {
    print("TOUTE LE CODE " + otp);
    var bodyItem = {
      "phone": '+243992135891', //currentNumber,
      "otp": otp,
    };

    final response = await http.post(
      VERIFY_OTP,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: bodyItem,
    );

    print("LA REPONSE =========================== TRAVAILLE");
    print(response.statusCode);
    print(response.body);
  }

  void sendOTP() async {
    String fullNUmber =
        "${currentCountry?['code']}${phoneNumberController.text}";
    var reqBody = {"phone": fullNUmber};
    final response = await http.post(SEND_OTP,
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
        },
        body: reqBody);
    if (response.statusCode == 200) {
      setState(() {
        otpSent = true;
        currentNumber = fullNUmber;
        isVerfiedNumber = true;
      });
    } else {
      // A VERIFIER APRES
      otpSent = true;
    }
    otpSent = true;
    print("STATUS CODE: ${response.statusCode}");
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          if (!otpSent) ...[
            DropdownButtonFormField(
              isExpanded: true,
              decoration: defaultDecoration('Choisissez votre pays'),
              items: countries
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text('${e['name']}'),
                      ))
                  .toList(),
              onChanged: (country) {
                setState(() {
                  currentCountry = country;
                });
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: phoneNumberController,
              validator: (value) {
                if (value == null) {
                  return "Le champs doit être rempli";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: defaultDecoration("Numéro de Téléphone").copyWith(
                prefixText: '${currentCountry?['code'] ?? ''} ',
              ),
            ),
            const SizedBox(height: 10.0),
            Button(
              label: "Envoyer OTP",
              onTap: () {
                sendOTP();
              },
            ),
          ] else ...[
            Text(
              'Un code a été envoyé au ${currentNumber}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              cursorColor: Theme.of(context).primaryColor,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldWidth: size.width * 0.15,
                fieldHeight: size.height * 0.065,
                borderRadius: BorderRadius.circular(0),
                activeColor: cardColor,
                inactiveColor: cardColor,
                selectedColor: cardColor,
                disabledColor: cardColor,
                selectedFillColor: cardColor,
                inactiveFillColor: cardColor,
                activeFillColor: cardColor,
                fieldOuterPadding: const EdgeInsets.all(5),
              ),
              animationDuration: const Duration(microseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              appContext: context,
              length: 4,
              onChanged: (code) {
                setState(() {
                  currentCode = code;
                });
              },
              onCompleted: (code) {
                verfierCode(code);
              },
              beforeTextPaste: (code) {
                return true;
              },
            ),
          ],
        ],
      ),
    );
  }
}
