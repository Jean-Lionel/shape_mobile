import 'package:flutter/material.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/screens/_lib.dart';

class HomeScreensPageView extends StatefulWidget {
  static const String routeName = "/hom_screens";
  const HomeScreensPageView({super.key});

  @override
  State<HomeScreensPageView> createState() => _HomeScreensPageViewState();
}

class _HomeScreensPageViewState extends State<HomeScreensPageView> {
  bool isTheAppInitialized = false;
  bool? isThisTheFirstTime;
  int currentPageIndex = 0;
  Widget currentWidget = Home();
  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  final screens = [
    {
      'icon': Icons.dashboard,
      'widget': Home(),
    },
    {
      'icon': Icons.settings,
      'widget': const Settings(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          key: const Key(appName),
          bucket: pageStorageBucket,
          child: currentWidget,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const Events(),
              ),
            );
          },
          child: const Icon(Icons.event, color: Colors.white),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: screens.map(
                (e) {
                  final isCurrent = currentPageIndex == screens.indexOf(e);
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentWidget = e['widget'] as Widget;
                          currentPageIndex = screens.indexOf(e);
                        });
                      },
                      child: Center(
                        child: Icon(
                          e['icon'] as IconData,
                          size: 35,
                          color: isCurrent
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ));
  }
}
