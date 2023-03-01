import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/provider/bottomnav_provdr.dart';
import 'package:makeframes/screens/homescreen&search/provider/alluser_provider.dart';
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
        title:  Padding(
          padding:const EdgeInsets.only(left: 5.0),
          // child: Text(
          //   'Settings',
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          // ),
          child: boldtext('Settings', Colors.white, 22),
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
                            child:normaltext("Terms & condition", Colors.white, 15)), 
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
                            child: normaltext("About Us", Colors.white, 15),
                            ),
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
                            child: normaltext("Share App", Colors.white, 15)),
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
                                      child: normaltext('cancel',const  Color.fromARGB(255, 29, 29, 29), 17), 
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        //DELETING THE TOKEN
                                        await storage.deleteAll(); 
                                    Provider.of<AllUserProvider>(context,listen: false).aristnullonsignout(); 
                                  log( Provider.of<AllUserProvider>(context,listen: false).actors.toString());  

                                        //NAVIGATING TO SIGN IN
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                         Splash()),  
                                                (route) => false);

                                        //BOTTOMNAV CHANGING TO HOMESCREEN
                                        Provider.of<BottomNavProvider>(context,
                                                listen: false)
                                            .currentIndex = 0;
                                      },
                                      child: normaltext('continue',const  Color.fromARGB(255, 143, 18, 9), 17), 
                                    ),
                                  ],
                                ),
                              );
                            },
                            child:  normaltext("Sign Out", Colors.white, 15)),
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
