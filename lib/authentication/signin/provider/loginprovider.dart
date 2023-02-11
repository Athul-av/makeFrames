import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/Services/signin&signup/signup_signin_service.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/authentication/signin/model/login_request_model.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';

class LoginProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isload = false;
  bool obscure = true;

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> loginButtonclicked(context) async {
    isload = true;
    notifyListeners();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final loguser = LoginreqModel(email: email, password: password);
    log("hi");
    await ApiService().login(loguser).then((value) => {
          log("message"),
          if (value!.isPass == true)
            {
              storage.write(key: 'token', value: value.token),
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => BottomNavigationScreen()),

                  (route) => false),
                  disposeTextfieldLogin() 
            }
          else
            {
              CustomSnackBar().snackBar(context, 'Invalid Username/Password',
                  const Color.fromARGB(255, 138, 35, 28))
            }
        });
    isload = false;
    notifyListeners();
  }

  void visibility() {
    if (obscure == true) {
      obscure = false;
    } else {
      obscure = true;
    }
    notifyListeners();
  }

  void disposeTextfieldLogin(){
    emailController.clear();
    passwordController.clear(); 
  }
}
