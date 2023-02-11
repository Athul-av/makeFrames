import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/signin&signup/signup_signin_service.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/authentication/signin/view/loginscreen.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? logincheck;
  timer(context) async {
    Timer(const Duration(seconds: 3), () async {
      logincheck = await storage.read(key: 'token');

      // checking the token valid or  not
      if (logincheck != null) { 
        ApiService().checktoken(logincheck!).then((value) {
          if (value!.user == true) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => BottomNavigationScreen()));
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginScreen()));
          }
        });
      }else{  
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }
}
