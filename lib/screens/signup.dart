import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../utils/colors.dart' as color;
import 'dashboard.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    List images = ["google.png",
    "fb.png"];

    return Scaffold(
      backgroundColor: color.AppColors.darkPrimary,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children:<Widget> [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 140, right: 135),
                child: Text(
                  " S I G N U P ",
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
                      color: color.AppColors.gradientColorTwo,
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
                            child: Text("Name : ",
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 22,
                                color: color.AppColors.lightPrimaryFour,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: color.AppColors.purplePrimary,
                                hintText: "Enter Name...",
                                prefixIcon: Icon(Icons.person, color: color.AppColors.shadedPrimary, )
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 15.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Email : ",
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 22,
                                color: color.AppColors.lightPrimaryFour,
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
                                fillColor: color.AppColors.purplePrimary,
                                hintText: "Enter E-mail...",
                                prefixIcon: Icon(Icons.email, color: color.AppColors.shadedPrimary, )
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 15.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Password : ",
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 22,
                                color: color.AppColors.lightPrimaryFour,
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
                                fillColor: color.AppColors.purplePrimary,
                                hintText: "Enter password",
                                prefixIcon: Icon(Icons.password, color: color.AppColors.shadedPrimary, )
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 30.0,),
                            Container(
                              child: Center(
                                child: SizedBox(
                          width: 250, // <-- Your width
                          height: 50,
                                         child: GestureDetector(
                            onTap: ()  {
                            },
                                                   child: ElevatedButton(
                                                             child:  Text(
                                "  S I G N - U P    ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Comfortaa",
                                    fontWeight: FontWeight.w900
                                ),
                              ),
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(color.AppColors.lightPrimaryOne),
                                backgroundColor: MaterialStateProperty.all<Color>(color.AppColors.purplePrimary),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: color.AppColors.purplePrimary)
                                  ),
                                ),
                                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)){
                                      return color.AppColors.shadedPrimary;
                                    }
                                  },
                                ),
                              ),
                              onPressed: () async {
                                if(emailController.text.trim().isEmpty || emailController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Name can't be empty!"),
                                      )
                                  );
                                }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(emailController.text.trim())){
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                    const SnackBar(
                                                                          content: Text("Email doesn't match the correct format : Please try something similar to abc@example.com!"),
                                               )
                                                                 );
                                                                   }
                                  if(emailController.text.trim().isEmpty || emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Name can't be empty!"),
                                        )
                                    );
                                  }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(emailController.text.trim())){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Email doesn't match the correct format : Please try something similar to abc@example.com!"),
                                        )
                                    );
                                  }
                                if(passwordController.text.trim().isEmpty || emailController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Password can't be empty!"),
                                      )
                                  );
                                }else if(passwordController.text.length < 8){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Password can't be less than 8 characters"),
                                      )
                                  );
                                }
                                try {
                                  showSpinner = true;
                                  final newUser = await _auth.createUserWithEmailAndPassword(
                                      email: emailController.text.trim(), password: passwordController.text.trim());
                                  if (newUser != null) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                           const SnackBar(
                                                               content: Text('Signup Successful!'),
                                                           )
                                                            );
                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                                  }
                                } catch (e) {
                                  print(e);
                                }
                                showSpinner=false;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                          SizedBox(height: 20.0,),
                          Center(
                            child: RichText(text: TextSpan(
                              text: "Signup through any of these ",
                              style: TextStyle(
                                color: color.AppColors.lightPrimaryFour,
                                fontSize: 16
                              )
                            )
                            ),
                          ),
                          Center(
                            child: Wrap(
                              children: List<Widget>.generate(
                                  2, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: color.AppColors.lightPrimaryFour,
                                        backgroundImage: AssetImage(
                                          "images/"+images[index]
                                        ),
                                      ),
                                    );
                              },
                              )
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
      ),
    );
  }
}
