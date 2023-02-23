import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/profilePicService/bring_profilepic.dart';

class DpGetProvider with ChangeNotifier {
  String? data;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getdp() async {
    String? token = await storage.read(key: 'token');
    data = await BringProfilePicService().bringDP(token!);
    notifyListeners();
  }
}
