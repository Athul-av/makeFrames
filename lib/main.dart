import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeframes/screens/bottomnav/provider/bottomnav_provdr.dart';
import 'package:makeframes/authentication/signin/provider/loginprovider.dart';
import 'package:makeframes/authentication/signup/provider/signup_provdr.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/splash/view/splash.dart';

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
        ChangeNotifierProvider(create: (context) => BottomNavProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home:  BottomNavigationScreen(), 
      ),
    );
  }
}
