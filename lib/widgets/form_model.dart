import 'package:flutter/material.dart';
import 'package:shapp/screens/_lib.dart';

class FormModel extends StatelessWidget {
  const FormModel({super.key, required this.title, required this.form});

  final String title;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                const ShappBg(),
                Column(
                  children: [
                    const SpendLess(),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: form,
                    ),
                  ],
                )
              ],
            ),
          ),
          // const SliverToBoxAdapter(child: SpendLess()),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: form,
          //   ),
          // ),
        ],
      ),
    );
  }
}
