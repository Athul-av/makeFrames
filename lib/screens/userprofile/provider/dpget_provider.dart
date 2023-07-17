

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/screens/userprofile/model/singleuser_detailsres.dart';
import 'package:makeframes/screens/userprofile/model/userdetails_res.dart';
import 'package:makeframes/services/profilePicService/bring_profilepic.dart';
import 'package:makeframes/services/singleuserService/singleuser_service.dart';

class DpGetProvider with ChangeNotifier {
  UserDetailsRes? data;
List<SingleUserDetailsRes> messagepeopledetais=[]; 
  List<dynamic>? messagedpeople = [];
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getdp() async {
   
    String? token = await storage.read(key: 'token');
    await BringProfilePicService().bringDP(token!).then((value) {
      data = value;
      if(data!.messagedPeople != null){
        messagedpeople = data!.messagedPeople;  
      }
   
    },);  
    notifyListeners();
  } 



  Future<void>chatlist()async{

    String? token = await storage.read(key: 'token'); 
 Future.delayed(const Duration(seconds: 3),()async{ 
   if(messagedpeople!.isNotEmpty){
    
      for(var value in messagedpeople!){
       
      await SingleUserService().getsingleuserdetails(value.toString(), token!).then((value){ 
      
      messagepeopledetais.add(value!); 
      });
  
    } 
    notifyListeners(); 
      }

 });
    
}
}