import 'package:airpol/utils/custom_app_bar.dart';
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
    return Scaffold(
      backgroundColor: color.AppColors.darkPrimary,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics() ,
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
         //     child: CovidBarChart(covidCases: covidUSADailyNewCases),
            ),
          ),
        ],
      ),
    );
  }
  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('My Area', style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
              Text('Other Areas',style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Pollutants' , style: TextStyle(fontSize: 17, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
              Text('AQI', style: TextStyle(fontSize: 17, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
              Text('Forecast', style: TextStyle(fontSize: 17, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold)),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

}
