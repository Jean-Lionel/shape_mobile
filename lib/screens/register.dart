import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/config/routes/routes.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';
import 'package:http/http.dart' as http;

import 'verify_phone_number.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void saveUserInput() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      var reqBody = {
        "prenom": prenomController.text,
        "nom": nomController.text,
        "adresseMail": emailController.text,
        "codePays": "+1", // UserSimplePeference.getCountryCode(),
        "telephone":
            "6892674454", // UserSimplePeference.getRegisterPhoneNumber(),
        "username": usernameController.text,
        "password": passwordController.text
      };
      try {
        final response = await postData(
          url: REGISTER_USER,
          data: reqBody,
        );
        String result = response.body as String;
        print("Response ===============: ");
        print(result);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error : Error")),
        );
      }
    }
  }

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
                                    controller: prenomController,
                                    decoration: defaultDecoration("Prénom"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Entre le nom';
                                      }
                                      return null;
                                    }),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                    controller: nomController,
                                    decoration:
                                        defaultDecoration("Nom de famille"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Entre le Prenom';
                                      }
                                      return null;
                                    }),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration:
                                      defaultDecoration("Email (Facultatif)"),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                    controller: usernameController,
                                    decoration:
                                        defaultDecoration("Nom d'utilisateur"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Le nom d'utilisateur est obligatoire";
                                      }
                                      return null;
                                    }),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration:
                                        defaultDecoration("Mot de passe"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Le mot de passe est obligatoire";
                                      }
                                      return null;
                                    }),
                                const SizedBox(height: 10.0),
                                Button(
                                  label: 'Register',
                                  onTap: () {
                                    saveUserInput();
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
