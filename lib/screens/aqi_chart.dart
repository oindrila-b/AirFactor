import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'aqi_model.dart';

class AQIChartData extends StatefulWidget {
  const AQIChartData({Key? key}) : super(key: key);

  @override
  State<AQIChartData> createState() => _AQIChartDataState();
}

class _AQIChartDataState extends State<AQIChartData> {
  late List<AQIModel> aqiData= [];
  late TooltipBehavior _tooltipBehavior ;

  getAQIDataFromSheet() async{
    var rawData = await  http.get(
        Uri.parse("https://script.google.com/macros/s/AKfycbwTh6D6dL3YYIH4ZZ9F6D5Li47_gj5z1vn90hFDy8H35j81e2Ro_L_hnB3ZlVN_dx2h/exec"));
        var jsonData = convert.jsonDecode(rawData.body);
    print(jsonData);
         jsonData.forEach((element){
        print(element['TimeStamp']);
        print( element['AQI']);
      var time = DateTime.parse(element['TimeStamp']).toUtc().toLocal();
      String formattedTime = DateFormat.jm().format(time);
      AQIModel aqiModel = new AQIModel(
          timeStamp: formattedTime,
          aqiValue: element['AQI']);
        aqiData.add(aqiModel);
        developer.log(aqiModel.timeStamp);
    });

}

  @override
  void initState() {
    getAQIDataFromSheet();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              child: SfCircularChart(
                title: ChartTitle(text: "Air Quality Index "),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
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
    );
  }
}
