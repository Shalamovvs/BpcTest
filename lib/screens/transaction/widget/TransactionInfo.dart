import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/screens/transaction/widget/RowInfo.dart';
import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({
    Key? key,
    required this.transaction
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          RowInfo(
            label: 'Номер транзакции', 
            text: '${transaction.number}'
          ),
          RowInfo(
            label: 'Тип операции', 
            text: '${transaction.type}'
          ),
          RowInfo(
            label: 'Дата транзакции', 
            text: '${transaction.date}'
          )
        ],
      ),
    );
  }
}