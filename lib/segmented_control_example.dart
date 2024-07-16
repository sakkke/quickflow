import 'package:flutter/cupertino.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

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
