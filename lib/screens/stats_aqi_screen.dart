import 'package:airpol/screens/aqi_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home.dart';

class StatAQI extends StatelessWidget {

  final List<AQIModel> aqiData;

  const StatAQI({Key? key,  required this.aqiData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              child: SfCircularChart(
                title: ChartTitle(text: "Air Quality Index "),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries>[
                  RadialBarSeries<AQIModel, String>(
                      useSeriesColor: true,
                      trackOpacity: 0.3,
                      dataSource: aqiData,
                      xValueMapper: (AQIModel model, _) => model.timeStamp,
                      yValueMapper: (AQIModel model, _) => model.aqiValue,
                      cornerStyle: CornerStyle.bothCurve
                  ),
                  RadialBarSeries<AQIModel, String>(
                      useSeriesColor: true,
                      trackOpacity: 0.3,
                      dataSource: aqiData,
                      xValueMapper: (AQIModel model, _) => model.timeStamp,
                      yValueMapper: (AQIModel model, _) => model.aqiValue,
                      cornerStyle: CornerStyle.bothCurve
                  )
                ],
              ),
            ),
          ),
        )
    );;
  }
}
