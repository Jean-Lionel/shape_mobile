import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/widgets/_lib.dart';

class ChangePhoneNumber extends StatefulWidget {
  const ChangePhoneNumber({super.key});

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return FormModel(
      title: 'Changer le numéro de téléphone',
      form: VerifyPhoneNumber(
        onSuccess: () {},
      ),
    );
  }
}
