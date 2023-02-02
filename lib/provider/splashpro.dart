import 'dart:async';
import 'package:flutter/material.dart';
import 'package:makeframes/screens/login/loginscreen.dart';

class splashProvider with ChangeNotifier{

   timer (context)async{
    Timer(const Duration(seconds: 3),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginScreen())); 
    }, );

  }
}