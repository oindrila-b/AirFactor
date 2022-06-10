import 'package:airpol/screens/aqi_chart.dart';
import 'package:airpol/utils/custom_app_bar.dart';
import 'package:airpol/utils/pollutants_stats_chart.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart'as color;
import '../utils/styles.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: color.AppColors.darkPrimary,
        appBar: AppBar(
          toolbarHeight: 120,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 28.0,
            onPressed: () {},
          ),
          backgroundColor: color.AppColors.darkPrimary,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 0.0, bottom: 10),
            child: Text("Statistics", style: TextStyle(fontSize: 40),),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_none),
              iconSize: 28.0,
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: color.AppColors.whiteColor,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('My Area', style : TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
              Text('Other Areas', style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: TabBarView(
            children: [
             DefaultTabController(
                 length: 2,
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
                            Text('Pollution', style : TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold, )),
                            Text('AQI', style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold,)),
                          ],
                        ) ,
                      ),
                   body: TabBarView(
                     children: [
                       Container(
                         child: PollutionData(),
                       ),
                       Container(
                         child: AQIChartData(),
                       )
                     ],
                   ),


             )
             ),
              Scaffold(
                backgroundColor: color.AppColors.darkPrimary,
              )
            ],
        ),
      ),
    );
  }

}
