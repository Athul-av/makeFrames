import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/Services/api_service.dart';
import 'package:makeframes/constant/snackbar.dart';
import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/models/otp_model.dart';
import 'package:makeframes/models/signup_request_model.dart';
import 'package:makeframes/screens/home/homesccreen.dart';
import 'package:makeframes/screens/login/otp_popup.dart';

class SignInProvdr with ChangeNotifier{
 
   final emailController = TextEditingController();
final passwordController = TextEditingController();
final repasswordController = TextEditingController();
final userNameController = TextEditingController();
TextEditingController otpController =TextEditingController(); 

 void signupButtonPress(BuildContext context)async{ 

    final email = emailController.text.trim();
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();
 
   final otp = otpController.text.trim();

   SignupReqModel model = SignupReqModel(email:email,firstName: username,password: password,otp: otp );

   
     ApiService().signup(model).then((value) {  
       if(value==true){
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  HomeScreen()), (route) => false) ; 
        // CustomSnackBar().snackBar(context, 'account created successfully', color1());  
        notifyListeners();  
          
       }else if(value==false){ 
              CustomSnackBar().snackBar(context, 'email already taken',const  Color.fromARGB(255, 27, 32, 130));
       }else{ 
        CustomSnackBar().snackBar(context, 'otp verification failed', const Color.fromARGB(255, 130, 34, 27));
       }

      } );
      
  }


   void otpgenrate(BuildContext context)async{       
    final email = emailController.text.trim();
       final password = passwordController.text.trim();
    final repassword = repasswordController.text.trim();
 
    OtpModel model= OtpModel(email: email);

  await  ApiService().otpGenerate(model).then((value){ 
      if(value&&password==repassword){ 
          displayTextInputDialog(context) ; 
      }else if(password != repassword){ 
        CustomSnackBar().snackBar(context, 'password is not match',const Color.fromARGB(255, 171, 42, 33)); 
      }else if(!value){ 
        CustomSnackBar().snackBar(context, 'enter valid email',const Color.fromARGB(255, 160, 45, 37)); 
      } 
     }
    );
  }
}