import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/services/allPosts/all_post_service.dart';
import 'package:makeframes/screens/userprofile/model/all_post_res.dart';

class AllPostProvider with ChangeNotifier {
  List<AllPostRes>? data;
  FlutterSecureStorage storage = const FlutterSecureStorage();

//function for getting the posts in artist profile which the artist posted
  Future<void> getallpost() async {
    String? token = await storage.read(key: 'token');
    data = await AllPostService().getallpost(token!);
    notifyListeners();
  }
}