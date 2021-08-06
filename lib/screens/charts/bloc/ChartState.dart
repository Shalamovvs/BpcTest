import 'package:equatable/equatable.dart';

abstract class ChartState extends Equatable{
  ChartState();

	@override
	List<Object> get props => [];
}

class ChartInitial extends ChartState {}

class ChartLoading extends ChartState {}

class ChartFailure extends ChartState {
  final String title;
  final String text;

  ChartFailure({required this.title,required this.text});

  @override
	List<Object> get props => [title, text];
}

class ChartSuccess extends ChartState{
  final Map<String, double> dataMap;

  ChartSuccess({required this.dataMap});

  @override
	List<Object> get props => [dataMap];
}