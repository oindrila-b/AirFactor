import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../screens/pollution_data.dart';

class PollutionData extends StatefulWidget {
  const PollutionData({Key? key}) : super(key: key);

  @override
  State<PollutionData> createState() => _PollutionDataState();
}

class _PollutionDataState extends State<PollutionData> {

  late List<PollutionDataModel> pollutionData= [];
  late TooltipBehavior _tooltipBehavior ;

  getDataFromSheet() async {

    developer.log("Hello");
    var rawData = await  http.get(
        Uri.parse("https://script.google.com/macros/s/AKfycbwTh6D6dL3YYIH4ZZ9F6D5Li47_gj5z1vn90hFDy8H35j81e2Ro_L_hnB3ZlVN_dx2h/exec"));

    var jsonData = convert.jsonDecode(rawData.body);
    print(jsonData);
    jsonData.forEach((element){
      var time = DateTime.parse(element['TimeStamp']).toUtc().toLocal();
      String formattedTime = DateFormat.jm().format(time);
      PollutionDataModel pollutionDataModel = new PollutionDataModel(
          timeStamp: formattedTime,
          coValue: element['Carbon_Monoxide'],
          no2Value: element['Nitrogen_DiOxide'],
          o3Value: element['Ozone'],
          pm10Value: element['PM_10'],
          pm25Value: element['PM_25'],
          so2Value: element['SO2']);

      pollutionData.add(pollutionDataModel);
    });

  }

  @override
  void initState() {
    getDataFromSheet();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: "Pollution Data "),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
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

