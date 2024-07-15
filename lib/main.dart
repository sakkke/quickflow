import 'package:flutter/cupertino.dart';

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
            navigationBar: CupertinoNavigationBar(
              middle: Text('混雑回避アプリ'),
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

class ListSectionInsetExample extends StatelessWidget {
  const ListSectionInsetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('発車駅情報'),
        children: <CupertinoListTile>[
          CupertinoListTile.notched(
            title: const Text('湘南新宿ライン'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _SecondPage(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile.notched(
            title: const Text('方向'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.systemRed,
            ),
            additionalInfo: const Text('Not available'),
          ),
          CupertinoListTile.notched(
            title: const Text('藤沢'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeOrange,
            ),
            additionalInfo: const Text('12 days ago'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _SecondPage(text: 'Last commit');
                },
              ),
            ),
          ),
          CupertinoListTile.notched(
            title: const Text('7:05'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
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

class ListSectionInsetExample2 extends StatelessWidget {
  const ListSectionInsetExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('発車駅情報'),
        children: <CupertinoListTile>[
          CupertinoListTile.notched(
            title: const Text('湘南新宿ライン'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _SecondPage(text: 'Open pull request');
                },
              ),
            ),
          ),
          CupertinoListTile.notched(
            title: const Text('方向'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.systemRed,
            ),
            additionalInfo: const Text('Not available'),
          ),
          CupertinoListTile.notched(
            title: const Text('藤沢'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeOrange,
            ),
            additionalInfo: const Text('12 days ago'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const _SecondPage(text: 'Last commit');
                },
              ),
            ),
          ),
          CupertinoListTile.notched(
            title: const Text('7:05'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
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
