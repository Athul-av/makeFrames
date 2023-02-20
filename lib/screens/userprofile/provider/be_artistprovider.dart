import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/BeArtistService/be_artist_service.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/model/be_artist_req.dart';
import 'package:makeframes/screens/userprofile/view/artist_profile.dart';
import 'package:provider/provider.dart';

class BeArtistProvider with ChangeNotifier{

 FlutterSecureStorage storage = const FlutterSecureStorage();
    TextEditingController aboutcontroller = TextEditingController();
 

 //BE ARTIST ON SUBMIT
  beArtist(context,dropdownvalue) async {
    final about = aboutcontroller.text.trim();
    String? token = await storage.read(key: 'token');

    BeArtistReq model =
        BeArtistReq(about: about, token: token, domain: dropdownvalue);

    BeArtistService().beArtist(model).then(( value ) {
      if (value == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ArtistProfileScreen()));

        Provider.of<SplashProvider>(context, listen: false).artist = true;
        notifyListeners();   
      } else { 
        CustomSnackBar().snackBar(context, 'something went wrong',
            const Color.fromARGB(255, 145, 34, 27)); 
      }
    });
  }
}