

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latlong2/latlong.dart';

import 'package:location/location.dart';
import 'package:makeframes/Services/bookstageshow/bookshow_service.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/stageShow/model/bookstage_Req.dart';

class BookStageProvider with ChangeNotifier{ 
MapController contrler = MapController();
 Location loction = Location();
 LatLng currentlatlng = LatLng(11.2588, 75.7804); 
 DateTime? pickeddate;
 TimeOfDay? picktime;
 String? spliteddate;
 TextEditingController addresscontroller = TextEditingController();
 TextEditingController numbercontroller = TextEditingController();
 FlutterSecureStorage storage = const FlutterSecureStorage();
 bool isload =false;
 
 
//to get the users current location
 void getcurrentlocation(context)async{ 
  var locationdata = await loction.getLocation();
  currentlatlng = LatLng(locationdata.latitude!, locationdata.longitude!);
  notifyListeners();  
 } 

//to select date from calendar
 selectDate(BuildContext context) async {
   pickeddate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), 
    firstDate: DateTime.now(),     
    lastDate: DateTime(2100),
  );
  spliteddate = "${pickeddate?.day.toString()}-${pickeddate?.month.toString()}-${pickeddate?.year.toString()}";   
  notifyListeners(); 
  
}

//select time from clock
selectTime(BuildContext context)async{
  picktime = await showTimePicker(
    context: context, 
    initialTime: TimeOfDay.now());
    notifyListeners(); 
}

//to show the marker in the taped position 
ontapmap(LatLng point){
  currentlatlng = point;
  notifyListeners(); 
}


//for book the stage show
Future<void> bookstageshow(id,context)async{
  isload = true;
  notifyListeners();

String? token = await storage.read(key: 'token'); 
final address = addresscontroller.text.trim();
final number = numbercontroller.text.trim();
Mark mark = Mark(latitude:currentlatlng.latitude,longitude: currentlatlng.longitude,zoom: 8 );

BookStageReqst model = BookStageReqst(address:address,date: pickeddate.toString(),time: picktime.toString(),mark:mark,mob: number,program_id: id,token: token ); 


await BookStageShowService().bookshow(model).then((value){
  if(value == true){
    CustomSnackBar().snackBar(context,'successfully booked', color1());
    log('suceess'); 
    Navigator.of(context).pop();
    disposeallfield();
  }else{
    CustomSnackBar().snackBar(context,"couldn't book the show", const Color.fromARGB(255, 150, 41, 33));
  }
}); 
 isload =false;
 notifyListeners();  
}


//clear all field
disposeallfield(){
  addresscontroller.clear();
  numbercontroller.clear(); 
  pickeddate = null;
  picktime = null;
  spliteddate = null; 
}
} 