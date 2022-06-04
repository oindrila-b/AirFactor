import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/area_dropdown.dart';
import '../utils/custom_app_bar.dart';
import '../utils/preventionimagedata.dart';
import 'bottom_nav_screen.dart';
import '../utils/colors.dart'as color;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _area = 'BTM';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: color.AppColors.whiteColor,
      appBar: CustomAppBar(),
      bottomSheet: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: color.AppColors.darkPrimary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'AIRFACTOR',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // AreaDropdown(
                //   areas:  ['BTM', 'BWSSB', 'JAYANAGAR', 'HEBBAL', 'PEENYA', 'SILKBOARD'],
                //   area: _area,
                //   onChanged: (val) => setState(() => _area = val!),
                // ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick due to any respiratory symptoms, please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ) ,
                                label: Text("Call here!",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Comfortaa",
                                      fontWeight: FontWeight.w900
                                  ),
                                ),
                              style: ButtonStyle(
                                backgroundColor:  MaterialStateProperty.all<Color>(color.AppColors.darkSecondaryFour),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: color.AppColors.darkSecondaryFour)
                                      )
                                  )
                              ), onPressed: () {  },
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton.icon(
                        onPressed: () {} ,
                        label: Text("SMS here!",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Comfortaa",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(color.AppColors.lightPrimaryOne),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: color.AppColors.lightPrimaryOne)
                                )
                            )
                        ),
                        icon:  Icon(
                          Icons.message,
                          color: Colors.white,
                        ) ,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(

        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Precaution Tips',
              style: const TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                children: <Widget>[
                  Image.asset(
                    e.keys.first,
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    e.values.first,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), color.AppColors.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('images/learn_affect.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pollutant Effects!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Learn more about the \neffect of Pollutants.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
