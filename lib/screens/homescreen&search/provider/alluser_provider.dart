
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/services/allUserDetails/alluser_service.dart';
import 'package:makeframes/screens/homescreen&search/model/alluser_resp.dart';

class AllUserProvider with ChangeNotifier{

 List<AllUsersDetailsRes>? datas=[];  
 List<AllUsersDetailsRes> artistdata=[];
 List<AllUsersDetailsRes> searchdata=[]; 
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
      if(value.domain == 'PRODUCER'){
        producers.add(value);  
        
      }else if(value.domain == 'ACTOR'){
        actors.add(value);
      }else if(value.domain == 'ACTRESS'){
        actress.add(value);
      }else if(value.domain == 'DIRECTOR'){
        directors.add(value); 
      }
      
    } 
    
  }   
 

 //search artist function
  searchartist(String key){
    if(key.isEmpty){
      searchdata =artistdata;
      notifyListeners(); 
    }else{
      searchdata = artistdata.where((element) => 
      element.domain!.toLowerCase().contains(key.toLowerCase().trim())|| element.firstName!.toLowerCase().contains(key.toLowerCase().trim())).toList();  
      notifyListeners();
    }
  }

 
  aristnullonsignout(){
    datas = null; 
    artistdata.clear();
    searchdata.clear();  
    producers.clear(); 
    actors.clear();
    directors.clear();
    actress.clear();
  }

} 