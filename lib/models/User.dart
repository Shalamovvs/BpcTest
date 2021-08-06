import 'package:bpc_test/models/Transaction.dart';

class UserData {

  final String email;

  List<Transaction> transactions;


  UserData({
    required this.transactions,
    required this.email,
  });

  static UserData fromMap(Map<String, dynamic> map) => UserData(
    email: map["email"],
    transactions: map["transactions"] != null ?(map["transactions"] as List<dynamic>).map((item) => Transaction.fromMap(item)).toList() : [],
  );
}