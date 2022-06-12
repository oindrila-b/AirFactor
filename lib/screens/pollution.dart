import 'package:airpol/screens/pollution_data.dart';
import 'package:airpol/screens/stats_screen.dart';
import '../utils/colors.dart'as color;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home.dart';

class Pollutions extends StatelessWidget {

   final List<PollutionDataModel> pollutionData;

  const Pollutions({Key? key, required this.pollutionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              iconSize: 28.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatsScreen()));
              },
            ),
            backgroundColor: color.AppColors.darkPrimary,
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 0.0, bottom: 30),
              child: Text("Pollution ", style: TextStyle(fontSize: 30),),
            ),
            actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.logout_rounded),
        iconSize: 28.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreens()));
        },
      ),
      ]
        ),
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
