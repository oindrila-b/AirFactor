import 'package:airpol/screens/aqi_model.dart';
import 'package:airpol/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart'as color;
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home.dart';

class AQIData extends StatelessWidget {
  
  final List<AQIModel> aqiData;
  
  const AQIData({Key? key,  required this.aqiData}) : super(key: key);

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
              child: Text("AQI ", style: TextStyle(fontSize: 30),),
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
