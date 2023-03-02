import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/userbooked_showdetails.dart/userbooked_show_service.dart';
import 'package:makeframes/screens/homescreen&search/model/user_bookingRes.dart';

class UserBookingListProvider with ChangeNotifier{

  List<UserBookingsResp>?  userbookings;
FlutterSecureStorage storage = const FlutterSecureStorage();

Future<void>  getuserbookingdetails()async{

  String? token = await storage.read(key: 'token');

  await UserBookedShowListService().getuserbookedshow(token!).then((value){

    userbookings = value;
   
  }); 
}

}