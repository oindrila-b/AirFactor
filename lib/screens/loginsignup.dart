import 'package:airpol/screens/login.dart';
import './signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart' as color;

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.AppColors.darkPrimary,
     height: (MediaQuery.of(context).size).height,
      width: (MediaQuery.of(context).size).width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset("images/loginSignupTop.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: 450,
              child: Card(
                color: color.AppColors.darkPrimary,
                child: Text(
                      " A I R "
                          "\n F A C T O R  ",
                  style: TextStyle(
                    color: color.AppColors.whiteColor,
                    fontFamily: "Comfortaa",
                    fontSize: 38,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
          ),

          Positioned(
            bottom: 350,
            height:45, //height of button
            width:210,
                  child: ElevatedButton(
                     child: Text(
                    "   L O G I N   ",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Comfortaa",
                           fontWeight: FontWeight.w900)
                             ),
                       style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(color.AppColors.darkSecondaryFour),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: color.AppColors.darkSecondaryFour)
                      )
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return color.AppColors.shadedPrimary;
                      return null; //
                    },
                     ),
                     ),
                     onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
              },
            ),
          ),

          Positioned(
            bottom: 250,
            height:45, //height of button
            width:210,
            child: ElevatedButton(

              child: Text(
                  "   S I G N - U P   ",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Comfortaa",
                      fontWeight: FontWeight.w900)
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(color.AppColors.lightPrimaryOne),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: color.AppColors.lightPrimaryOne)
                    )
                ),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return color.AppColors.shadedPrimary;
                    return null; //
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupPage()));
              },

            ),
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("images/loginSignupBotton.png",
              fit: BoxFit.contain,
            ),
          )

        ],
        
      ),
    );
  }
}
