import 'package:flutter/cupertino.dart';

import 'list_section_inset_example.dart';
import 'list_section_inset_example2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => buildHomePage(),
        '/route-selection': (BuildContext context) => buildPage('路線'),
        '/time-selection': (BuildContext context) => buildPage('発車時刻'),
        '/station-selection': (BuildContext context) => buildPage('発車駅'),
        '/information': (BuildContext context) => buildPage('n号車'),
      },
    );
  }

  Widget buildHomePage() {
    return const CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Quickflow'),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListSectionInsetExample(),
                ListSectionInsetExample2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage(String title) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: const Center(child: Icon(CupertinoIcons.share)),
    );
  }
}
