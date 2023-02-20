// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:makeframes/Services/AllPosts/all_post_service.dart';

// class AllPostProvider with ChangeNotifier{

//  List<List<String>>? images ; 
// FlutterSecureStorage storage = const FlutterSecureStorage();

// getallpost()async{
  
//   String? token = await storage.read(key: 'token');

//   await AllPostService().getallpost(token!).then((value) {
//     if(value != null){
//      log(value.toString()); 
//     }
//   });
// }

// }