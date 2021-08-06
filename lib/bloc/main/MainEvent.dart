import 'package:bpc_test/models/Transaction.dart';
import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainLoad extends MainEvent {}

class DeleteTransaction extends MainEvent {
  final Transaction transaction;

  DeleteTransaction({required this.transaction});

  @override
	List<Object> get props => [transaction];
}