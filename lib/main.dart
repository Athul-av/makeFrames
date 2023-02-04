import 'package:flutter/material.dart';
import 'package:makeframes/provider/loginProvider.dart';
import 'package:makeframes/provider/signUpProvdr.dart';
import 'package:makeframes/provider/splashpro.dart';
import 'package:makeframes/splash/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SplashProvider())),
        ChangeNotifierProvider(create: ((context) => SignUpProvdr())),
        ChangeNotifierProvider(create: ((context) => LoginProvider())), 
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
