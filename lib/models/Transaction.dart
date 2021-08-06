

class Transaction {

  final String type;

  final int id;

  final int number;

  final int sum;

  final String date;

  final num commission;

  final num total;


  Transaction({
    required this.type,
    required this.id,
    required this.number,
    required this.sum,
    required this.date,
    required this.commission,
    required this.total,
  });

  static Transaction fromMap(dynamic map) => Transaction(
    type: map["type"],
    id: map["id"],
    number: map["number"],
    sum: map["sum"],
    date: map["date"],
    commission: map["commission"],
    total: map["total"],
  );
}