// import 'package:flutter/material.dart';
// import 'package:matline/constant/color.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
//
//
//
// class ChartApp extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   ChartApp({Key? key}) : super(key: key);
//
//   @override
//   _ChartAppState createState() => _ChartAppState();
// }
//
// class _ChartAppState extends State<ChartApp> {
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;
//
//   @override
//   void initState() {
//     data = [
//       _ChartData('CHN', 12),
//       _ChartData('GER', 15),
//       _ChartData('RUS', 30),
//       _ChartData('BRZ', 6.4),
//       _ChartData('IND', 14)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//         primaryXAxis: CategoryAxis(),
//         primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
//         tooltipBehavior: _tooltip,
//         series: <ChartSeries<_ChartData, String>>[
//           BarSeries<_ChartData, String>(
//               dataSource: data,
//               xValueMapper: (_ChartData data, _) => data.x,
//               yValueMapper: (_ChartData data, _) => data.y,
//               name: 'Gold',
//               color: clrOrange),
//         ]);
//   }
// }
//
// class _ChartData {
//   _ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }