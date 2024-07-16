import 'package:flutter/cupertino.dart';

enum Direction { up, down }

class SegmentedControlExample extends StatefulWidget {
  const SegmentedControlExample({super.key});

  @override
  State<SegmentedControlExample> createState() =>
      _SegmentedControlExampleState();
}

class _SegmentedControlExampleState extends State<SegmentedControlExample> {
  Direction _selectedSegment = Direction.up;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<Direction>(
      backgroundColor: CupertinoColors.systemGrey2,
      thumbColor: CupertinoColors.activeGreen,
      // This represents the currently selected segmented control.
      groupValue: _selectedSegment,
      // Callback that sets the selected segmented control.
      onValueChanged: (Direction? value) {
        if (value != null) {
          setState(() {
            _selectedSegment = value;
          });
        }
      },
      children: const <Direction, Widget>{
        Direction.up: Text(
          '上り',
          style: TextStyle(color: CupertinoColors.white),
        ),
        Direction.down: Text(
          '下り',
          style: TextStyle(color: CupertinoColors.white),
        ),
      },
    );
  }
}
