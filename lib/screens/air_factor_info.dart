import '../utils/colors.dart' as color;
import 'package:flutter/material.dart';

import 'loginsignup.dart';

class AirFactorInfo extends StatelessWidget {
  const AirFactorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.darkPrimary,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          backgroundColor: color.AppColors.darkPrimary,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 0.0, bottom: 30),
            child: Text("AIR - FACTOR ", style: TextStyle(fontSize: 30),),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              iconSize: 28.0,
              onPressed: () {
                showAlertDialog(context);
              },
            ),
          ]
      ),
      body: Container(
        child :  ListWheelScrollView(
          itemExtent: 150,
          physics: FixedExtentScrollPhysics(),
          perspective: 0.002,
          diameterRatio: 2,
          children: [
            Card(
              child: SizedBox(
                width: 250,
                height: 80,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(" MAJOR PROJECT  \n 2021-2022", 
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 250,
                height: 20,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( "Creators : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
                      ),
                    )
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 250,
                height: 50,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( "Oindrila Banerjee  \n 1DS18CS085 ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18
                        ),
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
                      child: Text( "Jennifer Jeeyar \n 1DS18CS053",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18
                        ),
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
                      child: Text( " Kanishka Shah \n 1DS18CS055 ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          color: Colors.black
                        ),
                      ),
                    )
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: 250,
                height: 50,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( "Kushal Gopal \n 1DS18CS059 ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18
                        ),
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
                      child: Text( "Motivation For \n    Project :  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                        ),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Text( " 1. Harmful Effects of Air Pollution \n"

                          "",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
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
                      child: Text( "2. Recent Pollution Levels in Delhi\n  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
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
                      child: Text( "3. Lack of prediction of other Harmful Pollutants",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
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
                      child: Text( "Features :  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18
                        ),
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
                      child: Text( "Present Day Pollution Levels",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
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
                      child: Text( " Levels of AQI throughout the Day ",
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
                      child: Text( "AQI of  Other Areas",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
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
                      child: Text( "Forecast of other harmful Pollutant ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                        ),
                      ),
                    )),
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
}
