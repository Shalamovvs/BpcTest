import 'package:bpc_test/bloc/main/MainBloc.dart';
import 'package:bpc_test/bloc/main/MainEvent.dart';
import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/screens/transaction/widget/TransactionInfo.dart';
import 'package:bpc_test/screens/transaction/widget/TransactionMoney.dart';
import 'package:bpc_test/widgets/buttons/BottomFixedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTrnsaction extends StatelessWidget {
  const DetailTrnsaction({
    Key? key,
    required this.transaction
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, size: 17, color: Colors.white)
        ),
        title:  Text('${transaction.date}', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      floatingActionButton: BottomFixedButton(
        text: 'Отменить транзакцию',
        onPressed: () {
          BlocProvider.of<MainBloc>(context).add(DeleteTransaction(transaction: transaction));
          Navigator.of(context).pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TransactionMoney(transaction: transaction),
            SizedBox(
              height: 15,
            ),
            TransactionInfo(transaction: transaction)
          ],
        ),
      ),
    );
  }
}