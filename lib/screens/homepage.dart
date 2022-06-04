import 'package:airpol/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
  super.initState();
  _navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.primaryColor,
      body: Center(
        child: Container(
          child: Text(
            "     A I R \n"
                "F A C T O R",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
            fontSize: 65,
            color: color.AppColors.whiteColor),
          ),
        ),
      ),
    );
  }

  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context) =>OnBoardingScreens()));
  }


}
