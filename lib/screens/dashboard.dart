import 'package:airpol/screens/bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../utils/custom_app_bar.dart';
import '../utils/preventionimagedata.dart';
import '../utils/colors.dart'as color;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final TextEditingController _numberCtrl = TextEditingController();

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
                    fontSize: 20.0,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick due to any respiratory symptoms, please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontSize: 13.0,
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
                                      fontSize: 13,
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
                              ), onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                            },
                            ),
                          ),
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
            GestureDetector(
              child: Text(
                'Precaution Tips  >>',
                style: const TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                _showPrecautionsDialog(context);
              },
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
                      fontSize: 12.0,
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
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 15.0,
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
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Learn more about the \neffect of Pollutants.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 12.0,
                    ),
                    maxLines: 2,
                  ),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          _showHarmfulEffectDialog(context);
        },
      ),
    );
  }



  @override
  void initState() {
    _numberCtrl.text = "9051714858";
    super.initState();
  }

}

 _showHarmfulEffectDialog(BuildContext context) {

   Dialog alert = Dialog(
     backgroundColor: Colors.transparent,
     insetPadding: EdgeInsets.symmetric(
       vertical: 150.0,
       horizontal: 50.0
     ),
     child: Container(
       decoration: BoxDecoration(
         color: Colors.transparent,
         borderRadius: BorderRadius.circular(20.0),
       ),
       child: ListWheelScrollView(
         physics: FixedExtentScrollPhysics(),
         //perspective: 0.01,
           diameterRatio: 0.9,
         itemExtent: 200,
         children: [
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( " 1. Particulate Matter :  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 30,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect : \n1. Short-term health effects such as eye, nose, throat and lung irritation ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect : \n2. Chronic bronchitis, reduced lung function and increased mortality from lung cancer and heart disease.  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 30,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "2. Carbon Monoxide :  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect :\nFatigue, headaches, confusion, and dizziness due to inadequate oxygen delivery to the brain  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 30,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "3. Nitrogen Di-Oxide:  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect :\n 1.Damage to the human respiratory tract,respiratory infections and asthma  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 30,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "4. Ozone :  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect: \n 1. Chest pain, coughing, throat irritation, and congestion",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 30,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "5. Sulfur Di-Oxide :  ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
           Card(
             child: SizedBox(
               width: 250,
               height: 50,
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Text( "Effect :\n 1. Affects the respiratory system, particularly lung function, and can irritate the eyes ",
                       style: TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 15 ),
                     ),
                   )),
             ),
           ),
         ],
       ),
     ),
   );

     showDialog(context: context,
        builder:  (BuildContext context) {
          return alert;
        }
    );
}

_showPrecautionsDialog(BuildContext context) {

  Dialog alert = Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
      vertical: 300.0,
      horizontal: 50.0,
  ),

    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            elevation: 6,
            child: SizedBox(
              width: 250,
              height: 50,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/pubtrns.png"),
                  )
              ),
            ),
          ),
          SizedBox(width:  15,),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            elevation: 6,
            child: SizedBox(
              width: 250,
              height: 50,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/plantTrees.png"),
                  )),
            ),
          ),
          SizedBox(width:  15,),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            elevation: 6,
            child: SizedBox(
              width: 250,
              height: 50,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/recreu.png"),
                  )),
            ),
          ),
          SizedBox(width:  15,),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            elevation: 6,
            child: SizedBox(
              width: 250,
              height: 50,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/wearmask.png"),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context,
      builder:  (BuildContext context) {
        return alert;
      }
  );

}


