import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shapp/config/shared_preference/shared_preference_data.dart';
import 'package:shapp/models/user.dart';

import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/routes/routes.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    _emailController.text = "liza";
    _passwordController.text = "12345";
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    print("${_emailController.text} + ${_passwordController.text}");
    String username = _emailController.text;
    String pass = _passwordController.text;

    if (username.isNotEmpty && pass.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      var reqBody = {
        "username": username, //"admin@admin.com",
        "password": pass // "password",
      };

      try {
        final response = await http.post(
          LOGIN_URL,
          headers: {
            "content-type": "application/json",
            "Accept": "application/json"
          },
          body: jsonEncode(reqBody),
        );
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          String token = jsonResponse["access_token"];
          print("token : $token");
          prefs.setString('token', token);
          prefs.setString('user', jsonEncode(jsonResponse));
          // Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
          String userResponse = await User.userProfile();
          String jsonsDataString = userResponse.toString();
          final jsonData = jsonDecode(jsonsDataString);
          UserSimplePeference.setUserInfo(jsonsDataString);
          prefs.setString('user_id', jsonData['id'].toString());

          Navigator.of(context).popAndPushNamed(HomeScreensPageView.routeName);
        }

        print("================================================");
        print(response.body);
      } catch (e) {
        print(e);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      Navigator.of(context).popAndPushNamed(Login.routeName);
    }
  }

  final _formKey = GlobalKey<FormState>();
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
                      const SizedBox(height: 150.0),
                      const AppLogo(),
                      const Divider(),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration:
                                    defaultDecoration("Nom d'utilisateur"),
                                controller: _emailController,
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: false,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: defaultDecoration("Mot de passe"),
                              ),
                              const SizedBox(height: 10.0),
                              isLoading
                                  ? CircularProgressIndicator()
                                  : Button(
                                      label: 'Connexion',
                                      onTap: () {
                                        loginUser();
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Mot de passe oublié ?',
                        style: themeOf.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: themeOf.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                          text: TextSpan(
                        text: "Vous n'avez pas de compte ? ",
                        style: themeOf.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "S'inscrire",
                            style: themeOf.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: themeOf.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const Register(),
                                  ),
                                );
                              },
                          ),
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

class ShappBg extends StatelessWidget {
  const ShappBg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/logo.png",
              scale: 0.6,
              repeat: ImageRepeat.repeat,
            ),
          ),
          Positioned(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(.9),
            ),
          ),
        ],
      ),
    );
  }
}
