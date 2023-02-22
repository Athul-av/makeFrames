import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeframes/Services/ArtistcreateShowService/createshow_service.dart';
import 'package:makeframes/Services/uploadtocloudinary/uploadimage_cloud.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/model/createshow_req.dart';

class CreateShowProvider with ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  List<File>? img;
  File? video;
  String? cloudvideourl;
  bool isload = false;
  List<String>? cloudinaryimg;

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
      for (var i = 0; i < img!.length; i++) {
       await UploadService().uploadImageCloudinary(img![i]).then((value){ 
           cloudinaryimg?.add(value!);   
              
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
        Navigator.of(context).pop();
        clearTextfield();
        CustomSnackBar().snackBar(context, 'successfully created', color1());
      } else {
        CustomSnackBar().snackBar(context, "couldn't create",
            const Color.fromARGB(255, 144, 42, 34));
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
    notifyListeners();
  }
} 
