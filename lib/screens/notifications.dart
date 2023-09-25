import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Notifications'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                    children: List.generate(
                  2,
                  (index) => Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.lock_open,
                        ),
                        title: const Text(
                            'Your Event Pamoja Festival has been unlocked.'),
                        subtitle: const Text('2h ago . Shapp Team'),
                      ),
                      const Divider()
                    ],
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
