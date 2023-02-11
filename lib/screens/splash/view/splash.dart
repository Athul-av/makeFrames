import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).timer(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            const Text(''), 
            Container( 
              height: height(context, 0.13),
              width: width(context, 0.87),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Makeframes.png'),
                      fit: BoxFit.cover)),
            ),
             SizedBox(height: 38,width: 38  ,
            child: CircularProgressIndicator(color:color1(),), )
          ],
        ),
      ),
    );
  }
}
