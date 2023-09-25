import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/widgets/_lib.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutTheApp extends StatefulWidget {
  const AboutTheApp({super.key});

  @override
  State<AboutTheApp> createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {
  PackageInfo? packageInfo;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((pInfo) {
      setState(() {
        packageInfo = pInfo;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: "A propos de l'application",
      form: Column(
        children: [
          const SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              text: appName,
              style: Theme.of(context).textTheme.titleLarge,
              children: [
                const TextSpan(
                    text:
                        " est une application mobile conçue pour faciliter la création d'événements pour mariages, soutenances, conférences,... à moindre coût. Plus besoin de se déplacer pour distribuer des invitations; juste un clic de partage via email, WhatsApp, Facebook,..., Avec "),
                TextSpan(
                  text: appName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse("https://shapp.dewiya.online"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                ),
                const TextSpan(
                    text:
                        ", je gère mes evenements ou que je sois. Pour plus d'informations, visitez "),
                TextSpan(
                  text: "shapp.dewiya.online",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse("https://shapp.dewiya.online"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100.0),
           Text(
            "Dewiya-Tech",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (packageInfo != null) ...[
            const SizedBox(height: 16.0),
            Text("Version ${packageInfo?.version ?? ''}"),
          ],
        ],
      ),
    );
  }
}
