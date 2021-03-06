import 'package:bpc_test/widgets/forms/SignInForm.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Авторизоваться', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SignInForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}