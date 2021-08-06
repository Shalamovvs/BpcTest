import 'package:bpc_test/screens/auth/SingInScreen.dart';
import 'package:bpc_test/widgets/formFields/EmailForm.dart';
import 'package:bpc_test/widgets/formFields/PasswordForm.dart';
import 'package:bpc_test/widgets/formFields/SubmitPasswordForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overlay_support/overlay_support.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController submitPasswordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    submitPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          EmailForm(controller: emailController),
          PasswordForm(controller: passwordController),
          SubmitPasswordForm(controller: submitPasswordController),
          ElevatedButton(
            onPressed: () async {
              if (passwordController.text == submitPasswordController.text)
              {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                  );
                  databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").set({
                    'email': emailController.text
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(builder: (_) => SignInScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    showSimpleNotification(
                      Center(
                        child: const Text("Пользователь с этим Email адрессом уже существует", style: TextStyle(color: Colors.white))
                      ),
                      background: Colors.blue
                    );
                  }
                } catch (e) {
                  print(e);
                }
              }
              else
              {
                showSimpleNotification(
                  Center(
                    child: const Text("Введенные Вами пароли различаются", style: TextStyle(color: Colors.white))
                  ),
                  background: Colors.blue
                );
              }
            },
            child: const Text('Подтвердить')
          )
        ],
      ),
    );
  }
}