import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';  
import 'package:makeframes/Services/profilePicService/profilepic_add.dart';
import 'package:makeframes/Services/uploadtocloudinary/uploadimage_cloud.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/model/profilepic_add_req.dart';




class ProfilePicProvidr with ChangeNotifier{

  File? image;

  FlutterSecureStorage storage = const FlutterSecureStorage();

   Future getImage(context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final tempImg = File(image.path);
   
      this.image = tempImg; 
      notifyListeners(); 



//FUCTION TO ADD THE IMAGE TO CLOUDINARY
      await UploadService().uploadImageCloudinary(this.image!).then((value)async{
         if(value != null){


     CustomSnackBar().snackBar(context, "profile pic changed", color1());  

//CLOUDINARY RETURN A URL, ADD THAT TO THE BACKEND SERVER 
         String? token = await storage.read(key: 'token');
         ProfilePicReq model = ProfilePicReq(image:value,token:token );

         await ProfilePicAddService().addProfilepic(model).then((value) async{ 
          if(value == true){
       
          log('profile pic added to server');
           
      //  
      //   BringProfilePicService().bringDP(token!).then((value){
      //       if(value != null){
      //         dpimage = value; 
      //       }else{
      //         log('no dp'); 
      //       }
      //     })  ;      
         }else{

          CustomSnackBar().snackBar(context, 'unable to change profile pic',const Color.fromARGB(255, 152, 38, 30)); 
          log('unable to add profile pic to server');
          
          }
         });
       

          }else{
           log('not add');  
          }
        });   
  
  }

 
  
}