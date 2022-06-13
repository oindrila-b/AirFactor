import 'package:airpol/screens/loginsignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart' as color;

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: color.AppColors.darkPrimary,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 0.0, bottom: 30),
          child: Text("Forecasts ", style: TextStyle(fontSize: 30),),
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

