import 'package:flutter/material.dart';

class ColumnInfo extends StatelessWidget {
  const ColumnInfo({
    Key? key,
    required this.label,
    required this.text
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('$label', style: const TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 5),
          Text('$text', style: const TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}