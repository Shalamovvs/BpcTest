import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('$label', style: const TextStyle(color: Colors.white, fontSize: 14)),
          Text('$text', style: const TextStyle(color: Colors.blue, fontSize: 14))
        ],
      ),
    );
  }
}