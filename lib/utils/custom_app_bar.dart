import 'package:airpol/screens/home.dart';
import 'package:flutter/material.dart';
import '../screens/loginsignup.dart';
import 'colors.dart' as color;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color.AppColors.darkPrimary,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          iconSize: 28.0,
          onPressed: () {
            showAlertDialog(context);
          },
        ),
      ],
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}