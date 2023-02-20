import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeframes/Services/postService/post_service.dart';
import 'package:makeframes/Services/uploadtocloudinary/uploadimage_cloud.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/model/post_req.dart';

class PostProvidr with ChangeNotifier{
bool load = false;
  File? file;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  TextEditingController comentcontroller = TextEditingController();

   Future getfile(context) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);  
    
    if (file == null) return;

    final tempImg = File(file.path); 
    
      this.file = tempImg; 
      notifyListeners(); 


   }


  //FUCTION TO ADD THE IMAGE TO CLOUDINARY
   Future uploadpost(context)async{

    load = true;
    notifyListeners(); 


      await UploadService().uploadImageCloudinary(file!).then((value)async{
         if(value != null){

        log(value.toString()); 
     

//CLOUDINARY RETURN A URL, ADD THAT TO THE BACKEND SERVER 
         String? token = await storage.read(key: 'token');
         PostReq model = PostReq(images:value,token:token,coments: comentcontroller.text.trim()); 

         await Postservice().addpost(model).then((value) {
          if(value == true){
       CustomSnackBar().snackBar(context, 'posted successfully',color1());  
          log('post success');
            
      
         }else{

          // CustomSnackBar().snackBar(context, 'unable to change profile pic',const Color.fromARGB(255, 152, 38, 30)); 
          log('post failed');
          
          }
         });
        

          }else{
           log('not add'); 
          //  CustomSnackBar().snackBar(context, 'failed', const Color.fromARGB(255, 131, 43, 37)) ;
          }
        },
       
        ); 
        load = false;
        notifyListeners();
   }
}