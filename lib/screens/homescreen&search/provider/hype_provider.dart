
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/services/hypeservice/hypeprofile_service.dart';
import 'package:makeframes/services/hypeservice/hypestatus_service.dart';

class HypeProvider with ChangeNotifier{       

FlutterSecureStorage storage = const FlutterSecureStorage();


Future<void> givehype(String id,context)async{
  String? token = await storage.read(key: 'token');

  await HypeStatusService().hypestatus(token!, id).then((value)async{

    if(value == false){
       await GiveHypeService().givehype(token, id).then((value){
        if(value ==true){
          CustomSnackBar().snackBar(context,'Gave Hype', color1());
        } 
       });
    }else if(value == true){ 
       CustomSnackBar().snackBar(context,'Hype already given', const Color.fromARGB(255, 160, 43, 35));
    }else{
      CustomSnackBar().snackBar(context,'Something went wrong!', const Color.fromARGB(255, 160, 43, 35));
    }
  });


}

}