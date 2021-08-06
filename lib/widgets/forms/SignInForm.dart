import 'package:bpc_test/screens/main/HomeScreen.dart';
import 'package:bpc_test/widgets/formFields/EmailForm.dart';
import 'package:bpc_test/widgets/formFields/PasswordForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overlay_support/overlay_support.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: <Widget>[
          EmailForm(controller: emailController),
          PasswordForm(controller: passwordController),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text
                );
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (_) => HomeScreen()),
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  showSimpleNotification(
                    Center(
                      child: Text("Полльзователь с данным логином не найден", style: TextStyle(color: Colors.white))
                    ),
                    background: Colors.blue
                  );
                } else if (e.code == 'wrong-password') {
                  showSimpleNotification(
                    Center(
                      child: Text("Проверьте правильность ввода пароля", style: TextStyle(color: Colors.white))
                    ),
                    background: Colors.blue
                  );
                }
              }
            },
            child: Text('Подтвердить')
          )
        ],
      ),
    );
  }
}