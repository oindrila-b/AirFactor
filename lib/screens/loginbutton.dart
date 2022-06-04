import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart' ;
import '../utils/colors.dart' as color;


class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
            width: 250, // <-- Your width
            height: 50,
          child: ElevatedButton(
            child:  Text(
              "  L O G I N   ",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.w900
              ),
          ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(color.AppColors.darkSecondary),
                backgroundColor: MaterialStateProperty.all<Color>(color.AppColors.darkSecondarySix),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
        ),
      ),
    );
  }
}

