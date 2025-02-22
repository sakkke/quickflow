import 'package:flutter/cupertino.dart';
import 'package:quickflow/search_text_field_page.dart';

import 'direction_segmented_control.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class StationSelectionPage extends StatelessWidget {
  const StationSelectionPage({super.key});

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
            additionalInfo: DirectionSegmentedControl(),
          ),
          _buildListTile(
            context,
            title: '藤沢',
            subtitle: '発車駅',
            destination: const _StationSelectionPage(),
          ),
          _buildListTile(
            context,
            title: '7:05',
            subtitle: '発車時刻',
            destination: const _TimeSelectionPage(),
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
      // leading: ClipRRect(
      //   borderRadius: BorderRadius.circular(7.0),
      //   child: Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     color: CupertinoColors.activeGreen,
      //   ),
      // ),
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
        middle: Text("路線選択"),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchTextFieldPage(),
                isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : CupertinoListSection(
                        children: stations
                            .map<CupertinoListTile>(
                                (station) => CupertinoListTile(
                                      title: Text(station),
                                      // leading: ClipRRect(
                                      //   borderRadius: BorderRadius.circular(7.0),
                                      //   child: Container(
                                      //     width: double.infinity,
                                      //     height: double.infinity,
                                      //     color: CupertinoColors.activeGreen,
                                      //   ),
                                      // ),
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

class _StationSelectionPage extends StatefulWidget {
  const _StationSelectionPage({super.key});

  @override
  _StationSelectionPageState createState() => _StationSelectionPageState();
}

class _StationSelectionPageState extends State<_StationSelectionPage> {
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
      navigationBar: const CupertinoNavigationBar(
        middle: Text('駅選択'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SearchTextFieldPage(),
            Expanded(
              child: CupertinoScrollbar(
                child: isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        itemCount: stations.length,
                        itemBuilder: (context, index) {
                          return CupertinoListTile(
                            title: Text(stations[index]),
                            onTap: () {
                              // 駅が選択されたときの処理
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSelectionPage extends StatefulWidget {
  const _TimeSelectionPage({super.key});

  @override
  _TimeSelectionPageState createState() => _TimeSelectionPageState();
}

class _TimeSelectionPageState extends State<_TimeSelectionPage> {
  List<String> times = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTimes();
  }

  Future<void> fetchTimes() async {
    final response = await http.get(
        Uri.parse('https://quickflowapp.design-perspective.com/api/v1/times'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        times = (data['times'] as List<dynamic>)
            .map((time) => time['time'] as String)
            .toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load times');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('n号車'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoScrollbar(
                child: isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        itemCount: times.length,
                        itemBuilder: (context, index) {
                          return CupertinoListTile(
                            title: Text(times[index]), // 時刻を中央揃え
                            onTap: () {
                              // 時刻が選択されたときの処理
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
