import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/screens/userprofile/model/userdetails_res.dart';
import 'package:makeframes/services/profilePicService/bring_profilepic.dart';

class DpGetProvider with ChangeNotifier {
  UserDetailsRes? data;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getdp() async {
    String? token = await storage.read(key: 'token');
    await BringProfilePicService().bringDP(token!).then((value) {
      data = value;
      // log(value!.firstName.toString()); 
    },); 
    notifyListeners();
  }
}
