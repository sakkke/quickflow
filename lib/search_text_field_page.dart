import 'package:flutter/cupertino.dart';

class SearchTextFieldPage extends StatefulWidget {
  const SearchTextFieldPage({super.key});

  @override
  State<SearchTextFieldPage> createState() => _SearchTextFieldPageState();
}

class _SearchTextFieldPageState extends State<SearchTextFieldPage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchTextField(
                onChanged: (String value) {
                  setState(() {
                    text = value;
                  });
                },
                onSubmitted: (String value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
