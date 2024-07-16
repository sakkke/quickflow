import 'package:flutter/cupertino.dart';

import 'list_section_inset_example.dart';
import 'list_section_inset_example2.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

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
        '/': (BuildContext context) {
          return const CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemGrey6,
            navigationBar: CupertinoNavigationBar(
              middle: Text('Quickflow'),
            ),
            child: SafeArea(child: Column(
              children: [
                ListSectionInsetExample(),
                ListSectionInsetExample2(),
              ],
            )),
          );
        },
        '/route-selection': (BuildContext context) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('路線'),
            ),
            child: Center(child: Icon(CupertinoIcons.share)),
          );
        },
        '/time-selection': (BuildContext context) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('発車時刻'),
            ),
            child: Center(child: Icon(CupertinoIcons.share)),
          );
        },
        '/station-selection': (BuildContext context) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('発車駅'),
            ),
            child: Center(child: Icon(CupertinoIcons.share)),
          );
        },
        '/information': (BuildContext context) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('n号車'),
            ),
            child: Center(child: Icon(CupertinoIcons.share)),
          );
        }
      },
    );
  }
}

class SegmentedControlExample extends StatefulWidget {
  const SegmentedControlExample({super.key});

  @override
  State<SegmentedControlExample> createState() =>
      _SegmentedControlExampleState();
}

class _SegmentedControlExampleState extends State<SegmentedControlExample> {
  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<Sky>(
      backgroundColor: CupertinoColors.systemGrey2,
      thumbColor: skyColors[_selectedSegment]!,
      // This represents the currently selected segmented control.
      groupValue: _selectedSegment,
      // Callback that sets the selected segmented control.
      onValueChanged: (Sky? value) {
        if (value != null) {
          setState(() {
            _selectedSegment = value;
          });
        }
      },
      children: const <Sky, Widget>{
        Sky.midnight: Text(
          '上り',
          style: TextStyle(color: CupertinoColors.white),
        ),
        Sky.viridian: Text(
          '下り',
          style: TextStyle(color: CupertinoColors.white),
        ),
      },
    );
  }
}
