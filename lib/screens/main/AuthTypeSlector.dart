import 'package:bpc_test/screens/auth/SignUpScreen.dart';
import 'package:bpc_test/screens/auth/SingInScreen.dart';
import 'package:bpc_test/widgets/buttons/AuthTextButton.dart';
import 'package:flutter/material.dart';

class AuthTypeSelector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: const Text(
                  'Bpc.', style: TextStyle(
                    color: Colors.white, 
                    fontFamily: 'Comfortaa', 
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  )
                )
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFFFE1C08),
                borderRadius: BorderRadius.circular(50)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AuthTextButton(title: 'Регистрация', page: SignUpScreen()),
                  AuthTextButton(title: 'Авторизация', page: SignInScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}