import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/config/shared_preference/shared_preference_data.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await UserSimplePeference.init();
  runApp(ProviderScope(child: MyApp(token: prefs.getString('token'))));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({this.token, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.lightTheme,
      home: const Splash(),
      initialRoute: (token != null && token!.isNotEmpty)
          ? Home.routeName
          : Login.routeName,
    );
  }
}
