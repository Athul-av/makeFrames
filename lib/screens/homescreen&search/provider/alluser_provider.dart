import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/allUserDetails/alluser_service.dart';
import 'package:makeframes/screens/homescreen&search/model/alluser_resp.dart';

class AllUserProvider with ChangeNotifier{

 List<AllUsersDetailsRes>? datas=[]; 
 List<AllUsersDetailsRes> artistdata=[];
 List<AllUsersDetailsRes>? searchdata;
 List<AllUsersDetailsRes> producers=[];
 List<AllUsersDetailsRes> actors = [];
 List<AllUsersDetailsRes> directors = [];
 List<AllUsersDetailsRes> actress = [];
 FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getusers() async {
    String? token = await storage.read(key: 'token');
    
    datas = await AllUserService().getalluser(token!);
     //to get the artist profiles only
     for(AllUsersDetailsRes value in datas!){
      if(value.isArtist == true){
          artistdata.add(value);
     } 
     }
     searchdata= artistdata;
     notifyListeners();  
   //get the producers
    for(AllUsersDetailsRes value in artistdata){
      if(value.domain == 'Producer'){
        producers.add(value); 
      }else if(value.domain == 'Actor'){
        actors.add(value);
      }else if(value.domain == 'Actress'){
        actress.add(value);
      }else if(value.domain == 'Director'){
        directors.add(value); 
      }
      
    }
    log(producers.length.toString());
    log(actors.length.toString());
    log(actress.length.toString());
    log(directors.length.toString());
    notifyListeners();


  }   
 

 //search artist function
  searchartist(String key){
    if(key.isEmpty){
      searchdata =artistdata;
      notifyListeners(); 
    }else{
      searchdata = artistdata.where((element) => 
      element.domain!.toLowerCase().contains(key.toLowerCase().trim())).toList();
      notifyListeners();
    }
  }

} 