import 'package:flutter/cupertino.dart';

class SearchTextFieldExample extends StatefulWidget {
  const SearchTextFieldExample({super.key});

  @override
  State<SearchTextFieldExample> createState() => _SearchTextFieldExampleState();
}

class _SearchTextFieldExampleState extends State<SearchTextFieldExample> {
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
