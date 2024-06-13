import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class NewChart extends StatefulWidget {
  const NewChart({super.key});

  @override
  _NewChartState createState() => _NewChartState();
}

class _NewChartState extends State<NewChart> {

  // Define your pie chart data
  Map<String, double> dataMap = {
    "Online": 94,
    "Offline": 67,
    "Online Idle": 72
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart Demo'),
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          //chartColors: [Colors.red, Colors.yellow, Colors.orange, Colors.green],
          //hartLegend: dataMap.keys.toList(),
          animationDuration: Duration(milliseconds: 400),
        ),
      ),
    );
  }
}
