import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/screens/charts/bloc/ChartEvent.dart';
import 'package:bpc_test/screens/charts/bloc/ChartState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial()) {
    add(ChartLoad());
  }

  @override
  Stream<ChartState> mapEventToState(ChartEvent event) async* {
    if (event is GetChartData)
    {
      yield ChartLoading();
      yield ChartSuccess(dataMap: await _getData(event.transactions));
    }
  }
}

Future<Map<String, double>> _getData(List<Transaction> list) async {
  Map<String, double> dataMap = {
    "Пополнение": _getMap(list, 'Пополнение'),
    "Снятие": _getMap(list, 'Снятие'),
    "Перевод": _getMap(list, 'Перевод'),
  };
  return dataMap;
}

_getMap(List<Transaction> list, String type){
    double x = 0;
    for(int i = 0; i < list.length; i++)
    {
      if(list[i].type == type)
      {
        x++;
      }
    }

    return x;
  }