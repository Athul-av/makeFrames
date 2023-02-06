import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/api_service.dart';
import 'package:makeframes/constant/snackbar.dart';
import 'package:makeframes/models/signup_request_model.dart';
import 'package:makeframes/screens/home/homesccreen.dart';
import 'package:makeframes/screens/login/otp_popup.dart';

class SignUpProvdr with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final userNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

//otp calling function
  void getotp(context) async {
    isLoading = true;
    notifyListeners();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final repassword = repasswordController.text.trim();

    await ApiService().otpGet(email).then((value) {
      if (value != null && value == true && password == repassword) {
        displayTextInputDialog(context);
      } else if (password != repassword) {
        CustomSnackBar().snackBar(context, 'password is not match',
            const Color.fromARGB(255, 171, 42, 33));
      } else if (value == false) {
        CustomSnackBar().snackBar(context, 'enter valid email',
            const Color.fromARGB(255, 160, 45, 37));
      } else {
        CustomSnackBar().snackBar(context, 'something went wrong',
            const Color.fromARGB(255, 160, 45, 37));
      }
    });
    isLoading = false;
    notifyListeners();
  }


//signin function on the otp submit button
  void signupButtonPress(context) async {
    final email = emailController.text.trim();
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();
    final otp = otpController.text.trim();

    SignupReqModel model = SignupReqModel(
        email: email, firstName: username, password: password, otp: otp);

     ApiService().signup(model).then((value) {
      if (value!.signupResIs == false && value.serverOtp == true ) { 
       

         storage.write(key: 'token', value: value.token); 
       
        disposeTextfield(); 
         goToHome(context);

      } else if (value.signupResIs == true) {

        CustomSnackBar().snackBar(context, 'email already taken',
            const Color.fromARGB(255, 160, 45, 37));

      } else {

        // CustomSnackBar().snackBar(context, 'otp verification failed',
        //     const Color.fromARGB(255, 160, 45, 37));
      }
    });
  }


  void goToHome(context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    notifyListeners();
  }


  void disposeTextfield() {
    emailController.clear();
    userNameController.clear();
    passwordController.clear();
    repasswordController.clear();

  }

}
