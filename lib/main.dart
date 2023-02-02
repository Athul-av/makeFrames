import 'package:flutter/material.dart';
import 'package:makeframes/provider/signinProvdr.dart';
import 'package:makeframes/provider/splashpro.dart';
import 'package:makeframes/splash/splash.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => splashProvider())) ,
        ChangeNotifierProvider(create: ((context) => SignInProvdr())) ,
    
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  } 
}