import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Consommation extends StatefulWidget {
  const Consommation({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Consommation> createState() => _ConsommationState();
}

class _ConsommationState extends State<Consommation> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SfCartesianChart(
            title: ChartTitle(
                text: 'Monthly consumption '),
            legend: Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries>[
              StackedArea100Series<ExpenseData, String>(
                  dataSource: _chartData,
                  xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                  yValueMapper: (ExpenseData exp, _) => exp.Light,
                  name: 'Light',
                  markerSettings: MarkerSettings(
                    isVisible: true,
                  )),
              StackedArea100Series<ExpenseData, String>(
                  dataSource: _chartData,
                  xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                  yValueMapper: (ExpenseData exp, _) => exp.AC,
                  name: 'AC',
                  markerSettings: MarkerSettings(
                    isVisible: true,
                  )),
              StackedArea100Series<ExpenseData, String>(
                  dataSource: _chartData,
                  xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                  yValueMapper: (ExpenseData exp, _) => exp.Door,
                  name: 'Door',
                  markerSettings: MarkerSettings(
                    isVisible: true,
                  )),
              StackedArea100Series<ExpenseData, String>(
                  dataSource: _chartData,
                  xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                  yValueMapper: (ExpenseData exp, _) => exp.Heating,
                    name: 'Heating',
                  markerSettings: MarkerSettings(
                    isVisible: true,
                  )),
            ],
            primaryXAxis: CategoryAxis(),
          ),
        ));
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('January', 55, 40, 45, 48),
      ExpenseData('February', 33, 45, 54, 28),
      ExpenseData('March', 43, 23, 20, 34),
      ExpenseData('April', 32, 54, 23, 54),
      ExpenseData('May', 56, 18, 43, 55),
      ExpenseData('June', 23, 54, 33, 56),
      ExpenseData('July', 32, 54, 23, 54),
      ExpenseData('August', 56, 18, 43, 55),
      ExpenseData('September', 23, 54, 33, 56),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(this.expenseCategory, this.Light, this.AC, this.Door,
      this.Heating);

  final String expenseCategory;
  final num Light;
  final num AC;
  final num Door;
  final num Heating;
}

