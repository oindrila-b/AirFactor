import 'package:airpol/screens/other_aqi_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/colors.dart'as color;

class OtherAreaLoaded extends StatelessWidget {

  final List<OtherAQIModel> aqiData;

  const OtherAreaLoaded({Key? key, required this.aqiData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.darkPrimary,
      body:SafeArea(
          child: Scaffold(
            body:  SfCircularChart(
                title: ChartTitle(text: "AQI Data Other Stations"),
                legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries>[
                  DoughnutSeries<OtherAQIModel, String>(
                      dataSource: aqiData,
                      xValueMapper:  (OtherAQIModel model, _) => model.stationName,
                      yValueMapper: (OtherAQIModel model, _) => model.aqiValue,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    radius: '105%',
                  //  cornerStyle: CornerStyle.bothCurve
                  ),
                ]
            )
          )
      ),
    );
  }
}
