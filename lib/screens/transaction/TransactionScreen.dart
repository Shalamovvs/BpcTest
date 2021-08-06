import 'package:bpc_test/models/User.dart';
import 'package:bpc_test/screens/auth/SingInScreen.dart';
import 'package:bpc_test/screens/transaction/widget/TransactionList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({
    Key? key,
    required this.user
  }) : super(key: key);

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(builder: (_) => SignInScreen()),
            );
          },
          child: Icon(Icons.exit_to_app_outlined, size: 17)
        ),
        title: const Text('Транзакции', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: TransactionList(
        transactions: user.transactions,
      ),
    );
  }
}