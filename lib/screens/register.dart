import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool phoneNumberVerified = false;
  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          const ShappBg(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.4),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 80.0),
                      const AppLogo(),
                      const Divider(),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (phoneNumberVerified) ...[
                                Text(
                                  "Faisons plus ample connaissance",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: defaultDecoration("Prénom"),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration:
                                      defaultDecoration("Nom de famille"),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration:
                                      defaultDecoration("Email (Facultatif)"),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration:
                                      defaultDecoration("Nom d'utilisateur"),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: defaultDecoration("Mot de passe"),
                                ),
                                const SizedBox(height: 10.0),
                                Button(
                                  label: 'Register',
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const HomeScreensPageView()),
                                        (route) => false);
                                  },
                                ),
                              ] else
                                VerifyPhoneNumber(
                                  onSuccess: () {
                                    setState(() {
                                      phoneNumberVerified = true;
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                          text: TextSpan(
                        text: "Vous avez déjà un compte ? ",
                        style: themeOf.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "Se connecter",
                            style: themeOf.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: themeOf.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => const Login(),
                                  ),
                                  (route) => false,
                                );
                              },
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key, required this.onSuccess});

  final void Function() onSuccess;

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  Map? currentCountry;
  bool otpSent = false;
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
            DropdownButtonFormField(isExpanded: true,
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
              keyboardType: TextInputType.phone,
              decoration: defaultDecoration("Numéro de Téléphone").copyWith(
                prefixText: '${currentCountry?['code'] ?? ''} ',
              ),
            ),
            const SizedBox(height: 10.0),
            Button(
              label: 'Vérifier',
              onTap: () {
                setState(() {
                  otpSent = true;
                });
              },
            ),
          ] else ...[
            Text(
              'Un code a été envoyé au +25762670198',
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
              onChanged: (code) {},
              onCompleted: (code) {
                widget.onSuccess();
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
