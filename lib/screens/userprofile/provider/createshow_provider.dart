import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeframes/services/artistcreateShowService/createshow_service.dart';
import 'package:makeframes/services/uploadtocloudinary/uploadimage_cloud.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/model/createshow_req.dart';
import 'package:makeframes/screens/userprofile/provider/artistcreated_shows_prvdr.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CreateShowProvider with ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  

  List<File>? img;
  File? video;
  String? cloudvideourl;
  bool isload = false;
  List<String> cloudinaryimg=[];
  Uint8List? thumbnail ;

//GET MULTIPLE IMAGE FUNCTION
  Future<void> getimages() async {
    final List<XFile>? file = await ImagePicker().pickMultiImage();

    if (file == null) return;

    img = file.map((e) => File(e.path)).toList(); 
    
    notifyListeners();
  }

//GET VIDEO FUNCTION
  Future<void> getvideo() async {
    final XFile? file =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (file == null) return;

    video = File(file.path); 

  
   thumbnail = await VideoThumbnail.thumbnailData(
    video: video!.path,   
    imageFormat: ImageFormat.JPEG,
    quality: 50,
  );
  notifyListeners(); 
  

  }

//SUBMIT FUNCTION
  Future<void> createshow(category, context) async {
    isload = true;
    notifyListeners();

    //uploading video to cloudinary
    await UploadService().uploadvideoCloudinary(video!).then((value) {
    cloudvideourl = value;
    
    });

    //uploading multiple img
    for(var value in img!){
      await UploadService().uploadImageCloudinary(value).then((value) {
        cloudinaryimg.add(value!);
        notifyListeners();
      }); 
    }

    String? token = await storage.read(key: 'token');
    final name = namecontroller.text.trim();
    final amount = num.parse(amountcontroller.text);
    final about = aboutcontroller.text;

    CreateShowReq data = CreateShowReq(
        amount: amount,
        name: name,
        description: about,
        category: category,
        token: token,
        videoUrl: cloudvideourl,
        imageArray: cloudinaryimg);

    //adding the details to the server
    await CreateShowService().uploadStageShow(data).then((value) {
      if (value == true) {

        Provider.of<ArtistCreatedShowsProvider>(context, listen: false).artistshows();
        
        clearTextfield();
        Navigator.of(context).pop();
        CustomSnackBar().snackBar(context, 'successfully created', color1());
      } else {
        CustomSnackBar().snackBar(
            context, "couldn't create", const Color.fromARGB(255, 144, 42, 34));
      }
    });
    isload = false;
    notifyListeners();
  }

  clearTextfield() {
    namecontroller.clear();
    amountcontroller.clear();
    aboutcontroller.clear();
    img = null;
    video = null;
    thumbnail = null;
    cloudinaryimg = []; 
    cloudvideourl = null;

    notifyListeners();
  }
}
