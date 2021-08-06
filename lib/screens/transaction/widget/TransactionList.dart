import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/screens/transaction/DetailTransaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactions
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text('Количество транзакций: ${transactions.length}', style: const TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTrnsaction(transaction: transactions[index])));
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('№ ${transactions[index].number}', style: const TextStyle(fontSize: 16, color: Colors.white)),
                          Text('${transactions[index].type}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                        ],
                      ),
                      Text('${transactions[index].sum}\$', style: const TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}