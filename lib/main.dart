import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeframes/controller/bottomnav/bottomnav_provdr.dart';
import 'package:makeframes/controller/loginprovider/loginprovider.dart';
import 'package:makeframes/controller/signUpprovider/signup_provdr.dart';
import 'package:makeframes/controller/splashProvder/splashpro.dart';
import 'package:makeframes/screens/bottomnav/bottomnavscreen.dart';
import 'package:makeframes/screens/homescreen/homesccreen.dart';
import 'package:makeframes/screens/userprofile/beartist_form.dart';
import 'package:makeframes/splash/splash.dart';

import 'package:provider/provider.dart';

void main() {

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]); 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SplashProvider())),
        ChangeNotifierProvider(create: ((context) => SignUpProvdr())),
        ChangeNotifierProvider(create: ((context) => LoginProvider())), 
        ChangeNotifierProvider(create: (context)=> BottomNavProvider()) 
      ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        home:BottomNavigationScreen()  ,    
      ),
    );
  }
}
