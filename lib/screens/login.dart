import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/utils/utils.dart';
import 'package:shapp/widgets/_lib.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: defaultDecoration("Mot de passe"),
                              ),
                              const SizedBox(height: 10.0),
                              Button(
                                label: 'Connexion',
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const HomeScreensPageView(),
                                    ),
                                  );
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
