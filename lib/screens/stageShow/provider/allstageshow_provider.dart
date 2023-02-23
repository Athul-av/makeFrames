import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/AllStageShows/allstageshow_service.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';

class AllStageShowProvider with ChangeNotifier{
  
  List<AllStageShowRes>? data;
  List<AllStageShowRes>? alldata;
  FlutterSecureStorage storage =const  FlutterSecureStorage();

  Future<void> getallstage()async{

    String? token = await storage.read(key: 'token'); 

    await AllStageShowService().getallshows(token!).then((value) {

      data = value;
      alldata = value; 
      notifyListeners(); 
    });
  } 


void search(String keyboard){
  if(keyboard.isEmpty){
  data = alldata; 
  notifyListeners();

  }else{
    data = alldata!.where((element) =>   
    element.name!.toLowerCase().contains(keyboard.toLowerCase().trim())).toList(); 
    notifyListeners();
  }

}


}