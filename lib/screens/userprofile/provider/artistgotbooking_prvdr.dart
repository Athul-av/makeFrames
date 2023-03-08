import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:makeframes/services/artistgotBookings/acceptbooking_service.dart';
import 'package:makeframes/services/artistgotBookings/artistgotbookings_service.dart';
import 'package:makeframes/services/artistgotBookings/rejectbooking_service.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/model/artistgotbooking_res.dart';

class ArtistGotBookingProvider with ChangeNotifier{
  
  FlutterSecureStorage storage =const FlutterSecureStorage();
  MapController controlr = MapController();
  ArtistGotBookingRes? bookings;
  LatLng curntloc =LatLng(11.2588,  75.7804); 
  Location location =Location(); 

//to get current location
void currentloc(context)async{ 
  var locationdat = await location.getLocation();
  curntloc = LatLng(locationdat.latitude!, locationdat.longitude!);
  notifyListeners();  
 }


//to get all bookings
  getartistbookings(String id)async{
  
  String? token = await storage.read(key: 'token');

  await ArtistGotBookingService().getartistgotbooking(id, token!).then((value){

   bookings = value;
   notifyListeners();      
  }); 
  }


  //accept bookings
  acceptbooking(String id,context)async{

    String ? token = await storage.read(key: 'token');

    await AcceptBookingService().acceptshow(id, token!).then((value){
      if(value == true){
        
        CustomSnackBar().snackBar(context,'booking accepted ', color1());
        notifyListeners();
      }else{
        CustomSnackBar().snackBar(context,'something went wrong',const Color.fromARGB(255, 159, 46, 38));
        notifyListeners();
      }
    });
  }


  //reject bookings
  rejectbooking(String id,context)async{

    String ? token = await storage.read(key: 'token'); 

    await RejectBookingService().rejectshow(id, token!).then((value){ 
      if(value == true){ 
        CustomSnackBar().snackBar(context,'booking rejected ',const Color.fromARGB(255, 159, 46, 38));
        notifyListeners();
      }else{
        CustomSnackBar().snackBar(context,'something went wrong',const Color.fromARGB(255, 159, 46, 38));
        notifyListeners();
      }
    });
  }
}