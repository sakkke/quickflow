import 'package:flutter/cupertino.dart';

class ListSectionInsetExample2 extends StatelessWidget {
  const ListSectionInsetExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('混雑情報'),
        children: List.generate(8, (index) {
          return _buildListTile(
            context,
            title: '${index + 1}号車',
            subtitle: '快適',
            destination: const _SecondPage2(text: 'Open pull request'),
          );
        }),
      ),
    );
  }

  CupertinoListTile _buildListTile(BuildContext context,
      {required String title,
      required String subtitle,
      required Widget destination}) {
    return CupertinoListTile(
      title: Text(title),
      subtitle: Text(subtitle),
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
          builder: (BuildContext context) => destination,
        ),
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
