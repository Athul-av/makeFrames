// import 'dart:convert';

// import 'package:api_cache_manager/api_cache_manager.dart';
// import 'package:api_cache_manager/models/cache_db_model.dart';
// import 'package:flutter/material.dart';
// import 'package:makeframes/models/login_response_model.dart';
// import 'package:makeframes/screens/login/loginscreen.dart';

// class SharedService{
//   static Future<bool> isLoggedIn()async{

//     var isKeyExist = 
//           await APICacheManager().isAPICacheKeyExist("login_details");
  
//        return isKeyExist;  
//   }

//   static Future<LoginResp?> loginDetail () async{
//     var isKeyExist =await APICacheManager().isAPICacheKeyExist("login_details");

//     if(isKeyExist){
//       var cacheData = await APICacheManager().getCacheData("login_details");
//       return loginRespFromJson(cacheData.syncData);   
//     } 
//   }



//   static Future<void> setLoginDetails(LoginResp model)async{
//     APICacheDBModel cacheDBModel = APICacheDBModel(
//       key: "login_details", syncData: jsonEncode(model.toJson()));

//       await APICacheManager().addCacheData(cacheDBModel);
//   }

 
//  static Future<void> logout (BuildContext context)async{
//   await APICacheManager().deleteCache("login_details"); 

//  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false); 
//  }
// }