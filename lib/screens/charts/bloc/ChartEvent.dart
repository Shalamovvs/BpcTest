import 'package:bpc_test/models/Transaction.dart';
import 'package:equatable/equatable.dart';

abstract class ChartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChartLoad extends ChartEvent {}

class GetChartData extends ChartEvent {
  final List<Transaction> transactions;

  GetChartData({required this.transactions});

  @override
	List<Object> get props => [transactions];
}