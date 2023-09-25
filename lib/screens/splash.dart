import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/widgets/_lib.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _loadConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    return Scaffold(
        body: Column(
      children: [
        const Expanded(
          child: Center(
            child: AppLogo(),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'From Dewiya-Tech',
            style: themeOf.textTheme.titleMedium!.copyWith(
              color: themeOf.disabledColor,
            ),
          ),
        )
      ],
    ));
  }

  _loadConfig() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const Login()),
      );
    });
  }
}
