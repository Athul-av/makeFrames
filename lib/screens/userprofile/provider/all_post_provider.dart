// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:makeframes/Services/AllPosts/all_post_service.dart';
// import 'package:makeframes/screens/userprofile/model/all_post_res.dart';

// class AllPostProvider with ChangeNotifier {
//   List<AllPostRes>? data;
//   FlutterSecureStorage storage = const FlutterSecureStorage();

//   Future<void> getallpost() async {
//     String? token = await storage.read(key: 'token');
//     log(token.toString());
//     await AllPostService().getallpost(token!).then((value) {
//       if (value != null) {
//         log(value.toString());
//       }
//     });
//   }
// }
 