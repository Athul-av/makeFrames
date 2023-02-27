import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/artistcreatedshowsService/createdshow_servc.dart';
import 'package:makeframes/screens/userprofile/model/createdshow_res.dart';

class ArtistCreatedShowsProvider with ChangeNotifier {
  List<ArtistCreatedShowRes>? data;
  FlutterSecureStorage storage = const FlutterSecureStorage();

//to get the artist created shows in his profile
  Future<void> artistshows() async {
    String? token = await storage.read(key: 'token');
    data = await CreatedShowService().artiststagePrograms(token!);
    notifyListeners();
  }
}
