import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:makeframes/core/const.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: scaffoldback, 
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: [
            Column(
              children: [
                   Align(child: boldtext("Welcome to MakeFrames", Colors.white, 18)),
            hsizedbox(context, 0.04), 
            normaltext('''MakeFrames, the ultimate platform for artists and stage performers to showcase their talents and connect with their people! Our app is designed to provide a seamless experience for both artists and fans, enabling them to engage with each other like never before. 
            At MakeFrames, we believe that everyone has a unique talent, and our app is designed to help artists discover and showcase their talents to the world. Our platform is easy to use and offers a wide range of features.
            Thank you for choosing MakeFrames! We are excited to have you as part of our community and look forward to seeing your talents shine on our platform.
            ''',const  Color.fromARGB(255, 203, 203, 203), 14),
            hsizedbox(context, 0.015), 
            normaltext('Created by  : Athul A v & Sarath chand', Colors.white, 13),
            hsizedbox(context, 0.007),  
            normaltext('Contact us : avathulmkd@gmail.com', Colors.white, 13),
              ],
            ),
           
            const  SizedBox(
              height: 60,
              child: Image(image: AssetImage('assets/images/Makeframes2.png')),
            )  
          ],
        ),
      ),
    );
  }
}