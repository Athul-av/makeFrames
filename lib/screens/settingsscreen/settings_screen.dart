import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/provider/bottomnav_provdr.dart';
import 'package:makeframes/screens/settingsscreen/signoutdialog.dart';
import 'package:makeframes/screens/splash/view/splash.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.library_books_outlined,
                          color: Colors.white,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Terms & Conditions',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    ),
                  ),
                  hsizedbox(context, 0.006),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'About us',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    ),
                  ),
                  hsizedbox(context, 0.006),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Share app ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    ),
                  ),
                  hsizedbox(context, 0.006),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        TextButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (ctx) => PlaceholderDialog(
                                  title: 'Sign out',
                                  message:
                                      'Are you sure, do you want to signout?',
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(),
                                      child: const Text(
                                        'cancel',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 29, 29, 29),
                                            fontSize: 17),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {

                                    //DELETING THE TOKEN    
                                        await storage.deleteAll();
                                   
                                   //NAVIGATING TO SIGN IN
                                         Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Splash()),
                                                (route) => false);

                                  //BOTTOMNAV CHANGING TO HOMESCREEN
                                        Provider.of<BottomNavProvider>(context, listen: false) .currentIndex = 0;
                                      },
                                      child: const Text(
                                        'continue',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 143, 18, 9),
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text(
                              'Sign out ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
              child: Image(image: AssetImage('assets/images/Makeframes2.png')),
            )
          ],
        ),
      ),
    );
  }
}
