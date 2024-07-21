import 'package:flutter/cupertino.dart';
import 'package:quickflow/search_text_field_page.dart';

import 'direction_segmented_control.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ListSectionInsetExample extends StatelessWidget {
  const ListSectionInsetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: const Text('発車駅情報'),
        children: <CupertinoListTile>[
          _buildListTile(
            context,
            title: '湘南新宿ライン',
            subtitle: '路線',
            destination: const _RouteSelectionPage(),
          ),
          const CupertinoListTile(
            title: Text('方向'),
            additionalInfo: SegmentedControlExample(),
          ),
          _buildListTile(
            context,
            title: '藤沢',
            subtitle: '発車駅',
            destination: const _RouteSelectionPage(),
          ),
          _buildListTile(
            context,
            title: '7:05',
            subtitle: '発車時刻',
            destination: const _SecondPage(text: 'Open pull request'),
          ),
        ],
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

class _RouteSelectionPage extends StatefulWidget {
  const _RouteSelectionPage();

  @override
  _RouteSelectionPageState createState() => _RouteSelectionPageState();
}

class _RouteSelectionPageState extends State<_RouteSelectionPage> {
  List<String> stations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStations();
  }

  Future<void> fetchStations() async {
    final response = await http.get(Uri.parse(
        'https://quickflowapp.design-perspective.com/api/v1/stations'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        stations = (data['stations'] as List<dynamic>)
            .map((station) => station['name'] as String)
            .toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load stations');
    }
  }

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
            child: Column(
              children: [
                const SearchTextFieldExample(),
                isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : CupertinoListSection(
                        children: stations
                            .map<CupertinoListTile>((station) =>
                                CupertinoListTile(
                                  title: Text(station),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(7.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      color: CupertinoColors.activeGreen,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
