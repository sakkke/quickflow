import 'package:flutter/cupertino.dart';

enum Direction { up, down }

class DirectionSegmentedControl extends StatefulWidget {
  const DirectionSegmentedControl({super.key});

  @override
  State<DirectionSegmentedControl> createState() =>
      _DirectionSegmentedControlState();
}

class _DirectionSegmentedControlState extends State<DirectionSegmentedControl> {
  Direction _selectedSegment = Direction.up;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<Direction>(
      backgroundColor: CupertinoColors.systemGrey2,
      thumbColor: CupertinoColors.activeGreen,
      groupValue: _selectedSegment,
      onValueChanged: (Direction? value) {
        if (value != null) {
          setState(() {
            _selectedSegment = value;
          });
        }
      },
      children: _buildSegmentedControlChildren(),
    );
  }

  Map<Direction, Widget> _buildSegmentedControlChildren() {
    return const <Direction, Widget>{
      Direction.up: Text(
        '上り',
        style: TextStyle(color: CupertinoColors.white),
      ),
      Direction.down: Text(
        '下り',
        style: TextStyle(color: CupertinoColors.white),
      ),
    };
  }
}
