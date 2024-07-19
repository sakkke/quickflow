import 'package:flutter/cupertino.dart';

import 'segmented_control_example.dart';

class ListSectionInsetExample extends StatelessWidget {
  const ListSectionInsetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('発車駅情報'),
        children: <CupertinoListTile>[
          CupertinoListTile(
            title: const Text('湘南新宿ライン'),
            subtitle: const Text('路線'),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.activeGreen,
              ),
            ),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _RouteSelectionPage();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('方向'),
            additionalInfo: const SegmentedControlExample(),
          ),
          CupertinoListTile(
            title: const Text('藤沢'),
            subtitle: const Text('発車駅'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _RouteSelectionPage();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('7:05'),
            subtitle: const Text('発車時刻'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _SecondPage(text: 'Open pull request');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class _RouteSelectionPage extends StatelessWidget {
  const _RouteSelectionPage();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        middle: Text("駅選択"),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: CupertinoListSection(
              children: <CupertinoListTile>[
                CupertinoListTile(
                  title: const Text('湘南新宿ライン'),
                  subtitle: const Text('現在'),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: CupertinoColors.activeGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
