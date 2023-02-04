import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/api_service.dart';
import 'package:makeframes/screens/home/homesccreen.dart';
import 'package:makeframes/screens/login/loginscreen.dart';

class SplashProvider with ChangeNotifier {

   FlutterSecureStorage storage = const FlutterSecureStorage();
   String? logincheck;
  timer(context) async {
    Timer(
      const Duration(seconds: 3),
      ()async {
     logincheck = await storage.read(key: 'token');

     // checking the token valid or  not
      ApiService().checktoken(logincheck!).then((value) {

      if(value!.user==true){ 
         Navigator.of(context)
           .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen())); 
      }else{
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen())); 
      }
     });
       },
    );
  }
}
