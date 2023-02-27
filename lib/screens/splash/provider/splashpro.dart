import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/authenticationService/signup_signin_service.dart';
import 'package:makeframes/Services/checkUser/artist_check.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/authentication/signin/view/loginscreen.dart';
import 'package:makeframes/screens/stageShow/provider/allstageshow_provider.dart';
import 'package:makeframes/screens/userprofile/provider/all_post_provider.dart';
import 'package:makeframes/screens/userprofile/provider/artistcreated_shows_prvdr.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:provider/provider.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? logincheck;
  String username = '';
  bool artist = false;
  // String? dp ;

  timer(context) async {
    Timer(const Duration(milliseconds: 1700), () async {
      logincheck = await storage.read(key: 'token');

      //CHECKING THE TOKEN VALID OR NOT
      if (logincheck != null) {
        AuthApiService().checktoken(logincheck!).then((value) {
          
          //THE FUNCTION RETURNING THE TOKEN VALID OR NOT AND THE USERNAME
          if (value!.user == true) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => BottomNavigationScreen()));

            username = value.firstName!;
            notifyListeners();

            //CHECK THE USER IS ARTIST OR NOT
            ArtistCheck().checkartist(logincheck!).then((value) {
              if (value!.isArtist == true) {
                artist = true;
                notifyListeners();
              } else if (value.isArtist == false) {
                artist = false;
                notifyListeners();
              }
            });

            //to get the posted images in profile
            Provider.of<AllPostProvider>(context, listen: false).getallpost();
            //to get dp image in profile
            Provider.of<DpGetProvider>(context, listen: false).getdp();
            //to get artist created shows in artist profile
            Provider.of<ArtistCreatedShowsProvider>(context, listen: false)
                .artistshows();
            //to get all stage shows
            Provider.of<AllStageShowProvider>(context,listen: false).getallstage(); 
           
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginScreen()));
          }
        });
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }
}
