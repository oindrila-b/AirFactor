import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../utils/colors.dart' as color;
import 'loginsignup.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        done: Text('Done', style: TextStyle(
          color: color.AppColors.whiteColor
        ),
        ),
        onDone: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginSignUp()));
        },
        pages: getPages(),
        globalBackgroundColor: color.AppColors.darkPrimary,
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeColor: color.AppColors.lightPrimaryOne,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
      ),
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Container(
            child: Image.asset('images/splash_one.png')
        ),
        title: 'Pollution levels for today ',
        body: 'Discover the current pollution levels for your area !',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white, fontFamily: "Comfortaa"),
            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Comfortaa"),
          ),
      ),
      PageViewModel(
        image: Image.asset('images/splash_two.png'),
        title: 'Pollution levels for tomorrow !',
        body: 'Discover the predicted pollution levels for tomorrow!',
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white, fontFamily: "Comfortaa"),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Comfortaa"),
        ),
      ),
      PageViewModel(
        image: Image.asset('images/splash_three.png'),
        title: 'Prevention !',
        body: 'Take the necessary steps to prevent the increase of pollution !!',
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white, fontFamily: "Comfortaa"),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Comfortaa"),
        ),
        footer: SizedBox(
          height:50, //height of button
          width:250,
          child: ElevatedButton(
              child: Text(
                  "Let's Get Started!",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginSignUp()));
              },

          ),
        ),
      ),
    ];
  }



}
