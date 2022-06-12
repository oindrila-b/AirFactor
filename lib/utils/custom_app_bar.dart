import 'package:airpol/screens/home.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color.AppColors.darkPrimary,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          iconSize: 28.0,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreens()));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}