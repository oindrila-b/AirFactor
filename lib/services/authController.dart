import 'package:airpol/screens/dashboard.dart';
import 'package:airpol/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import '../utils/colors.dart' as color;
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
    static AuthController instance = Get.find();
    late Rx<User?> _user;

    FirebaseAuth auth = FirebaseAuth.instance;

    @override
  void onReady() {
    super.onReady();
    _user  =  Rx<User?> (auth.currentUser);
    _user.bindStream(auth.userChanges());
        ever(_user, _initialScreen);
  }

  _initialScreen(User? _user) {
        if(_user==null){
            print("Login page");
            Get.offAll(() => LoginPage());
        }else {
            Get.offAll(() => Dashboard());
        }
  }

  // Future<void> register(String email, password) async {
  //      try{
  //          await auth.createUserWithEmailAndPassword(email: email, password: password);
  //      }catch(e){
  //          Get.snackbar("About User", "User Message",
  //           backgroundColor: color.AppColors.purplePrimary,
  //           snackPosition: SnackPosition.BOTTOM,
  //              titleText: Text(
  //                  "Account Creation Failed",
  //                  style: TextStyle(
  //                      color: color.AppColors.whiteColor,
  //                  ),
  //              ),
  //              messageText: Text(
  //                  e.toString(),
  //                  style: TextStyle(
  //                      color: color.AppColors.whiteColor,
  //                  ),
  //              ),
  //          );
  //      }
  // }
//
}