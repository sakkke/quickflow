import 'package:flutter/cupertino.dart';

class ListSectionInsetExample2 extends StatelessWidget {
  const ListSectionInsetExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('混雑情報'),
        children: <CupertinoListTile>[
          CupertinoListTile(
            title: const Text('1号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('2号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('3号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('4号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('5号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('6号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('7号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('8号車'),
            subtitle: const Text('快適'),
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
                  return const _SecondPage2(text: 'Open pull request');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondPage2 extends StatelessWidget {
  const _SecondPage2({required this.text});

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
