import 'package:airpol/screens/aqi_stless.dart';
import 'package:airpol/screens/pollution.dart';
import 'package:airpol/screens/pollution_data.dart';
import 'package:airpol/screens/stats_aqi_screen.dart';
import 'package:airpol/screens/stats_pol_screen.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart'as color;
import '../utils/styles.dart';
import 'aqi_model.dart';
import 'home.dart';
import 'loginsignup.dart';
import 'otherArea_stless.dart';
import 'other_aqi_model.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {

   List<PollutionDataModel> pollutionData = [];
   List<AQIModel> aqiData= [];
   List<OtherAQIModel> otherAQIData= [];

  getDataFromSheet() async {

    developer.log("Hello");
    var rawData = await  http.get(
        Uri.parse("https://script.google.com/macros/s/AKfycbwTh6D6dL3YYIH4ZZ9F6D5Li47_gj5z1vn90hFDy8H35j81e2Ro_L_hnB3ZlVN_dx2h/exec"));

    var jsonData = convert.jsonDecode(rawData.body);
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

   getAQIDataFromSheet() async{
     var rawData = await  http.get(
         Uri.parse("https://script.google.com/macros/s/AKfycbwTh6D6dL3YYIH4ZZ9F6D5Li47_gj5z1vn90hFDy8H35j81e2Ro_L_hnB3ZlVN_dx2h/exec"));
     var jsonData = convert.jsonDecode(rawData.body);
     jsonData.forEach((element){
       var time = DateTime.parse(element['TimeStamp']).toUtc().toLocal();
       String formattedTime = DateFormat.jm().format(time);
       AQIModel aqiModel = new AQIModel(
           timeStamp: formattedTime,
           aqiValue: element['AQI']);
       aqiData.add(aqiModel);
     });

   }

   getOtherAreasFromSheet() async {
     var rawData = await http.get(
         Uri.parse(
             "https://script.google.com/macros/s/AKfycbwCYnPIZ6Lu73JPuq-7Jn3b-l3xiPW9hRr4AgM4FNDxYsL6jQ_0AncceOC_V2YZhpZD7w/exec"));
     var jsonData = convert.jsonDecode(rawData.body);
     jsonData.forEach((element) {
       print(element);
       OtherAQIModel otherAQIModel = OtherAQIModel(
           stationName: element['StationName'],
           aqiValue: element['AQIValue']);
       otherAQIData.add(otherAQIModel);
     });
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
            child: Text("Statistics", style: TextStyle(fontSize: 30),),
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
              Text('My Area', style : TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
              Text('Other Areas', style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
            ],
            onTap: (index) {
            },
          ),
        ),
        body: TabBarView(
            children: [
             DefaultTabController(
                 length: 2,
                 child: Container(
                   child: Scaffold(
                      backgroundColor: color.AppColors.darkPrimary,
                        appBar: AppBar(
                          backgroundColor: color.AppColors.darkPrimary,
                          elevation: 0.0,
                          automaticallyImplyLeading: false,
                          toolbarHeight: 5,
                          bottom: TabBar(
                            indicator: BubbleTabIndicator(
                              tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              indicatorHeight: 30.0,
                              indicatorColor: color.AppColors.shadedPrimary,
                            ),
                            tabs: [
                              Text('Pollution', style : TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold, )),
                              Text('AQI', style: TextStyle(fontSize: 15, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold,)),
                            ],
                            onTap: (index) {
                              if(index == 0) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Pollutions(pollutionData: pollutionData,)));
                              }else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AQIData(aqiData: aqiData)));
                              }
                            },
                          ) ,
                        ),
                     body: TabBarView(
                       children: [
                         GestureDetector(
                           child: StatPollution(pollutionData: pollutionData),
                           onTap:() => {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Pollutions(pollutionData: pollutionData))),
                           },
                         ),
                         GestureDetector(
                           child: StatAQI(aqiData: aqiData),
                           onTap:() => {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => AQIData(aqiData: aqiData))),
                           },
                         )
                       ],
                     ),
             ),
                 )
             ),
              GestureDetector(
              child: OtherAreaLoaded(aqiData: otherAQIData),
              ),
            ],
        ),
      ),
    );
  }

   showAlertDialog(BuildContext context) {
     Widget cancelButton = ElevatedButton(
       child: Text("Cancel"),
       onPressed:  () {
         Navigator.pop(context);
       },
     );
     Widget continueButton = ElevatedButton(
       child: Text("Continue"),
       onPressed:  () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUp()));
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

  @override
  void initState() {
    getAQIDataFromSheet();
    getOtherAreasFromSheet();
    getDataFromSheet();
    super.initState();
  }
}
