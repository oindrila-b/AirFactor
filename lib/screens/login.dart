import 'package:firebase_auth/firebase_auth.dart';

import './signup.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart' as color;
import 'bottom_nav_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: color.AppColors.darkPrimary,
      body: Column(
        children:<Widget> [
          Expanded(
            flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 210, right: 135),
                child: Text(
                  " L O G I N ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.AppColors.whiteColor,
                fontFamily: "Comfortaa",
                fontSize: 50
            ),
          ),
              ),
          ),
          Expanded(
            flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: color.AppColors.darkSecondaryFour,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Email : ",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 22,
                            color: color.AppColors.darkSecondarySix,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: color.AppColors.darkSecondarySix,
                              hintText: "Enter E-mail",
                              prefixIcon: Icon(Icons.email, color: color.AppColors.darkSecondaryFour, )
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        SizedBox(height: 20.0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Password : ",
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 22,
                              color: color.AppColors.darkSecondarySix,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: color.AppColors.darkSecondarySix,
                              hintText: "Enter password",
                              prefixIcon: Icon(Icons.password, color: color.AppColors.darkSecondaryFour, )
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 10.0,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupPage()));
                          },
                          child: Text(
                            "Forgot your Password?",
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 15,
                              color: color.AppColors.darkSecondarySix,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 65.0,),
                        Container(
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
                                onPressed: () async{
                                  try {
                                    showSpinner = true;
                                    final newUser = await _auth.signInWithEmailAndPassword(
                                        email: emailController.text.trim(), password: passwordController.text.trim());
                                    if (newUser != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Login Successful!'),
                                          )
                                      );
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Couldn't Log in! PLease check the credentials and try again"),
                                        )
                                    );
                                    print(e);
                                  }
                                  showSpinner=false;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 65.0,),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignupPage()));
                            },
                            child: Text(
                              "Don't have an account ? SIGN-UP",
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 15,
                                color: color.AppColors.darkSecondarySix,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          )
          ),
        ],
      ),
    );
  }
}

