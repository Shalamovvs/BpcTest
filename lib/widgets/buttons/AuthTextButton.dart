import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String title;
  final Widget page;

  AuthTextButton({required this.title, required this.page});

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xFFFE1C08))
        ),
      ),
      onPressed: () => _pushPage(context, page), 
      child: Text(
        '$title', 
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Comfortaa',
          color: Color(0xFFFE1C08),
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}