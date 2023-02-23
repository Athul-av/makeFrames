import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class UploadService {
  Future<String?> uploadImageCloudinary(File imagefile) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/dyn6m4tou/image/upload';

    final dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    ));

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagefile.path),
      "upload_preset": 'nefiqdoa'
    });

    try {
      final response = await dio.post(cloudinaryUrl, data: formData,
          options: Options(validateStatus: ((status) {
        return status! < 299;
      })));

      final jsonBody = response.data;

      return jsonBody['secure_url'];
    } on DioError catch (e) {
      if (e.response != null) {
        log('http error ${e.response!.statusCode}');
      } else {
        log('network error: $e');
      }
    }
    return null;
  }




  Future<String?> uploadvideoCloudinary(File video) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/dyn6m4tou/video/upload';

    final dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    ));

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(video.path),
      "upload_preset": 'nefiqdoa'
    });

    try {
      final response = await dio.post(cloudinaryUrl, data: formData,
          options: Options(validateStatus: ((status) {
        return status! < 299;
      })));

      final jsonBody = response.data;

      return jsonBody['secure_url'];
    } on DioError catch (e) {
      if (e.response != null) {
        log('http error ${e.response!.statusCode}');
      } else {
        log('network error: $e');
      }
    }
    return null;
  }
}
