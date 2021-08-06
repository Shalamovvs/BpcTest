import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/screens/transaction/widget/ColumnInfo.dart';
import 'package:flutter/material.dart';

class TransactionMoney extends StatelessWidget {
  const TransactionMoney({
    Key? key,
    required this.transaction
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFF8B1C2C),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: <Widget>[
          if (transaction.type == 'Пополнение')
            Text('+ ${transaction.sum}', style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold))
          else
            Text('- ${transaction.sum}', style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
          ColumnInfo(
            label: 'Комиссия', 
            text: '${transaction.commission}'
          ),
          ColumnInfo(
            label: 'Итого', 
            text: '${transaction.total}'
          )
        ],
      ),
    );
  }
}