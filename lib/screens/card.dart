// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardComp extends StatelessWidget {
  final String title;
  final String subtitle;
  final String describe;
  final String nameButton;
  final String dateInvite;
  final Image qrCodeImage;

  const CardComp({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.describe,
    required this.nameButton,
    required this.dateInvite,
    required this.qrCodeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 60),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Text(
              describe,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: qrCodeImage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            nameButton,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          dateInvite,
          style: const TextStyle(fontSize: 20),
        ),
      ]),
    );
  }
}
