import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeframes/screens/homescreen&search/provider/alluser_provider.dart';
import 'package:makeframes/screens/bottomnav/provider/bottomnav_provdr.dart';
import 'package:makeframes/authentication/signin/provider/loginprovider.dart';
import 'package:makeframes/authentication/signup/provider/signup_provdr.dart';
import 'package:makeframes/screens/homescreen&search/provider/hype_provider.dart';
import 'package:makeframes/screens/homescreen&search/provider/userbookinglist_provider.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/splash/view/splash.dart';
import 'package:makeframes/screens/stageShow/provider/allstageshow_provider.dart';
import 'package:makeframes/screens/stageShow/provider/bookstage_provider.dart';
import 'package:makeframes/screens/userprofile/provider/all_post_provider.dart';
import 'package:makeframes/screens/userprofile/provider/artistcreated_shows_prvdr.dart';
import 'package:makeframes/screens/userprofile/provider/artistgotbooking_prvdr.dart';
import 'package:makeframes/screens/userprofile/provider/be_artistprovider.dart';
import 'package:makeframes/screens/userprofile/provider/createshow_provider.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:makeframes/screens/userprofile/provider/post_provider.dart';
import 'package:makeframes/screens/userprofile/provider/profile_photo.dart';
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
        ChangeNotifierProvider(create: ((context) => BottomNavProvider())),
        ChangeNotifierProvider(create: (context) => BeArtistProvider()),
        ChangeNotifierProvider(create: (context) => ProfilePicProvidr()),
        ChangeNotifierProvider(create: (context) => PostProvidr()),
        ChangeNotifierProvider(create: (context) => CreateShowProvider()),
        ChangeNotifierProvider(create: (context) => AllPostProvider()),
        ChangeNotifierProvider(create: (context) => DpGetProvider()),
        ChangeNotifierProvider(create: (context) => ArtistCreatedShowsProvider()),
        ChangeNotifierProvider(create: (context) => AllStageShowProvider()),
        ChangeNotifierProvider(create: (context) => AllUserProvider()),
        ChangeNotifierProvider(create: (context) => BookStageProvider()),
        ChangeNotifierProvider(create: (context) => UserBookingListProvider()),
        ChangeNotifierProvider(create: (context) => ArtistGotBookingProvider()),
        ChangeNotifierProvider(create: (context) => HypeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash(),           
      ),
    );
  }
}
