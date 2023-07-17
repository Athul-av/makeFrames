
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/services/authenticationService/signup_signin_service.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/authentication/signup/model/signup_request_model.dart';
import 'package:makeframes/authentication/signup/view/otp_popup.dart';
import 'package:makeframes/screens/splash/view/splash.dart';

class SignUpProvdr with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final userNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  bool obscure = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();

//OTP CALLING FUNCTION
  void getotp(context) async {
    isLoading = true;
    notifyListeners();

    final email = emailController.text.trim();
    // final password = passwordController.text.trim();
    // final repassword = repasswordController.text.trim();

    log(email);

    // await AuthApiService().otpGet(email).then((value) {
    //   log("sdfa"); 
    //   if (value != null && value == true && password == repassword) {
    //     displayTextInputDialog(context);
    //   } else if (value == false) {
    //     CustomSnackBar().snackBar(context, 'enter valid email',
    //         const Color.fromARGB(255, 160, 45, 37));
    //   } else {
    //     CustomSnackBar().snackBar(context, 'something went wrong',
    //         const Color.fromARGB(255, 160, 45, 37));
    //   }
    // });
     AuthApiService().otpGet(email);
     displayTextInputDialog(context);  
     log("complete"); 
    isLoading = false;
    notifyListeners();
  }

//SIGNUP ON THE OTP BUTTON PRESSED
  Future<void> signupButtonPress(context) async {  
    final email = emailController.text.trim();
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();
    final otp = otpController.text.trim();

    final SignupReqModel model = SignupReqModel(
        email: email, firstName: username, password: password, otp: otp);

   await AuthApiService().signup(model).then((value)=> {
      if ( value!.serverOtp == true)
       {

         storage.write(key: 'token', value:value.token), 
     
         
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const Splash()),
                  (route) => false),
                 
              disposeTextfield()

      } else if (value.signupResIs == true) {
        CustomSnackBar().snackBar(context, 'email already taken',
            const Color.fromARGB(255, 160, 45, 37)),
        Navigator.of(context).pop(),
        otpController.clear()
      } else {
        CustomSnackBar().snackBar(context, 'otp verification failed',
            const Color.fromARGB(255, 160, 45, 37)),
        Navigator.of(context).pop(),
        otpController.clear()
      }
    });
  }

 

//CLEAR THE TEXT FIELD
  void disposeTextfield() {
    emailController.clear();
    userNameController.clear();
    passwordController.clear();
    repasswordController.clear();
    otpController.clear(); 
  }


//PASSWORD VISIBILITY FUNCTION
  void visibility() {
    if (obscure == true) {
      obscure = false;
    } else {
      obscure = true;
    }
    notifyListeners();
  }
}
