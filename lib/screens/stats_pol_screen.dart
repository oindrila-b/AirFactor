import 'package:airpol/screens/pollution_data.dart';
import 'package:airpol/screens/stats_screen.dart';
import '../utils/colors.dart'as color;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home.dart';

class StatPollution extends StatelessWidget {

  final List<PollutionDataModel> pollutionData;

  const StatPollution({Key? key, required this.pollutionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: "Pollution Data "),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<PollutionDataModel, String>>[
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.coValue,
                name: "CO", markerSettings: MarkerSettings(isVisible: true)),
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.no2Value,
                name: "NO2",
                markerSettings: MarkerSettings(isVisible: true)),
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.o3Value,
                name: "Ozone",
                markerSettings: MarkerSettings(isVisible: true)),
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.pm10Value,
                name: "PM 10",
                markerSettings: MarkerSettings(isVisible: true)),
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.pm25Value,
                name: "PM 2.5",
                markerSettings: MarkerSettings(isVisible: true)),
            ColumnSeries<PollutionDataModel, String>(
                dataSource: pollutionData,
                xValueMapper:  (PollutionDataModel pollutionData, _) => pollutionData.timeStamp,
                yValueMapper: (PollutionDataModel pollutionData, _) => pollutionData.so2Value,
                name: "Sulfur Di-oxide",
                markerSettings: MarkerSettings(isVisible: true)),
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(maximum: 65),
        ),
      ),
    );
  }
}
