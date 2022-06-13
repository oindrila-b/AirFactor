import 'package:airpol/screens/loginsignup.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/colors.dart' as color;
import '../utils/styles.dart';

class ForecastScreen extends StatefulWidget {

  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {

  late List<PM10_Prediction> _chartData;
  late List<CO_Prediction> _coChartData;

  @override
  void initState() {
    _chartData = getPM10Data();
    _coChartData = getCOData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: color.AppColors.darkPrimary,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 0, bottom: 10),
            child: Text("FORECAST", style: TextStyle(fontSize: 30),),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              iconSize: 28.0,
              onPressed: () {
                showAlertDialog(context);
              },
            ),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 35.0,
              indicatorColor: color.AppColors.whiteColor,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('PM 10', style: TextStyle(fontSize: 18,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold)),
              Text('CO', style: TextStyle(fontSize: 18,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold)),
            ],
            onTap: (index) {},
          ),
        ),
        body: TabBarView(
          children: [
            SafeArea(
              child: Scaffold(
                body: SfCartesianChart(
                  legend: Legend(isVisible: true),
                  enableAxisAnimation: true,
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries>[
                    ColumnSeries<PM10_Prediction, String>(
                      color: color.AppColors.darkSecondaryFive,
                        dataSource: _chartData,
                        xValueMapper: (PM10_Prediction model, _) => model.date,
                        yValueMapper: (PM10_Prediction model, _) => model.pm10,
                        markerSettings: MarkerSettings(isVisible: true),
                      name: "PM10"
                    )
                  ],
                  primaryXAxis: CategoryAxis(
                    labelRotation: 90,
                  ),
              ),
            ),
            ),
            SafeArea(
              child: Scaffold(
                body: SfCartesianChart(
                  legend: Legend(isVisible: true),
                  enableAxisAnimation: true,
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries>[
                    ColumnSeries<CO_Prediction, String>(
                        dataSource: _coChartData,
                        color: color.AppColors.darkPrimaryTwo,
                        xValueMapper: (CO_Prediction model, _) => model.date,
                        yValueMapper: (CO_Prediction model, _) => model.co,
                        markerSettings: MarkerSettings(isVisible: true),
                        name: "CO"
                    )
                  ],
                  primaryXAxis: CategoryAxis(
                    labelRotation: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginSignUp()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("LOGOUT!"),
      content: Text("Would you like to exit the Application ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

List<PM10_Prediction> getPM10Data() {
  final List<PM10_Prediction> chartData = [

    PM10_Prediction(date: "2022-06-10", pm10: 93.84),
    PM10_Prediction(date: "2022-06-11", pm10: 93.90),
    PM10_Prediction(date: "2022-06-12", pm10: 93.97),
    PM10_Prediction(date: "2022-06-13", pm10: 94.04),
    PM10_Prediction(date: "2022-06-14", pm10: 94.12),
    PM10_Prediction(date: "2022-06-15", pm10: 94.21),
    PM10_Prediction(date: "2022-06-16", pm10: 94.30),
    PM10_Prediction(date: "2022-06-17", pm10: 94.39),
    PM10_Prediction(date: "2022-06-18", pm10: 94.48),
    PM10_Prediction(date: "2022-06-19", pm10: 94.56),
    PM10_Prediction(date: "2022-06-20", pm10: 94.65),
    PM10_Prediction(date: "2022-06-21", pm10: 94.74),
    PM10_Prediction(date: "2022-06-22", pm10: 94.83),
    PM10_Prediction(date: "2022-06-23", pm10: 94.92),
    PM10_Prediction(date: "2022-06-24", pm10: 94.99),
    PM10_Prediction(date: "2022-06-25", pm10: 95.04),
    PM10_Prediction(date: "2022-06-26", pm10: 95.09),
    PM10_Prediction(date: "2022-06-27", pm10: 95.14),
    PM10_Prediction(date: "2022-06-28", pm10: 95.18),
    PM10_Prediction(date: "2022-06-29", pm10:  95.20),
    PM10_Prediction(date: "2022-06-30", pm10:  95.22),
  ];
  return chartData;
}

List<CO_Prediction> getCOData() {
  final List<CO_Prediction> coChartData = [

    CO_Prediction(date: "2022-06-10", co: 0.7957),
    CO_Prediction(date: "2022-06-11", co: 0.7958),
    CO_Prediction(date: "2022-06-12", co: 0.7960),
    CO_Prediction(date: "2022-06-13", co: 0.7966),
    CO_Prediction(date: "2022-06-14", co: 0.7970),
    CO_Prediction(date: "2022-06-15", co: 0.7981),
    CO_Prediction(date: "2022-06-16", co: 0.7983),
    CO_Prediction(date: "2022-06-17", co: 0.7986),
    CO_Prediction(date: "2022-06-18", co: 0.7986),
    CO_Prediction(date: "2022-06-19", co: 0.7994),
    CO_Prediction(date: "2022-06-20", co: 0.7999),
    CO_Prediction(date: "2022-06-21", co: 0.8002),
    CO_Prediction(date: "2022-06-22", co: 0.8008),
    CO_Prediction(date: "2022-06-23", co: 0.8011),
    CO_Prediction(date: "2022-06-24", co: 0.8015),
    CO_Prediction(date: "2022-06-25", co: 0.8020),
    CO_Prediction(date: "2022-06-26", co: 0.8026),
    CO_Prediction(date: "2022-06-27", co: 0.8032),
    CO_Prediction(date: "2022-06-28", co: 0.8039),
    CO_Prediction(date: "2022-06-29", co:  0.8045),
    CO_Prediction(date: "2022-06-30", co:  0.8051),
  ];
  return coChartData;
}

class PM10_Prediction {
  late  String date;
  late  num pm10;

  PM10_Prediction ({
     required this.date,
    required this.pm10
});

}

class CO_Prediction {
  late  String date;
  late  num co;

  CO_Prediction ({
    required this.date,
    required this.co
  });

}






