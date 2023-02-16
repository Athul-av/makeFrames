import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/authenticationService/signup_signin_service.dart';
import 'package:makeframes/Services/checkUser/artist_check.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/authentication/signin/view/loginscreen.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? logincheck;
  String username = '';
  bool artist= false;

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

            ArtistCheck().checkartist(logincheck!).then((value){
              if(value!.isArtist == true){ 
                artist = true; 
                notifyListeners();
              } else if (value.isArtist == false){
                artist  = false;
                notifyListeners();
              }
            }
            );
            username = value.firstName!;
            notifyListeners();

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
