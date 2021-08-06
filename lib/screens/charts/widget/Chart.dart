import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.dataMap
  }) : super(key: key);

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      legendOptions: LegendOptions(
        legendPosition: LegendPosition.bottom,
        showLegendsInRow: true
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        decimalPlaces: 0,
        chartValueStyle: const TextStyle(
          color: Colors.white, 
          fontSize: 22, 
          fontWeight: FontWeight.w600
        )
      ),
      animationDuration: Duration(milliseconds: 800),
      chartType: ChartType.ring,
    );
  }
}