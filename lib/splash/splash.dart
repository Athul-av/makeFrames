import 'package:flutter/material.dart';
import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/provider/splashpro.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<splashProvider>(context, listen: false).timer(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: height(context, 0.13),
          width: width(context, 0.87),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Makeframes.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
