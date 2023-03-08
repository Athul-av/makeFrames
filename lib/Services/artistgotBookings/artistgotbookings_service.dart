import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/artistgotbooking_res.dart';

class ArtistGotBookingService {
  Dio dio = Dio();

  Future<ArtistGotBookingRes?> getartistgotbooking(
      String id, String token) async {
    String path = Apiconfig.baseUrl + Apiconfig.artistgotbookings;
    final option = Options(headers: {'Authorization':'Bearer $token'}); 
    try {
      Response response = await dio.post(path,
          data: {'id': id}, options: option);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('hi');
        // final List<dynamic> jsondata = response.data; 
        //  log('hi2');
        // final res = jsondata.map((e) => ArtistGotBookingRes.fromJson(e)).toList();

        // return res;
        final Map<String,dynamic> json = response.data; 
        ArtistGotBookingRes res = ArtistGotBookingRes.fromJson({'pend':json['pend'],'acc':json['acc'],'his':json['his']});
        return res;
        

      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
