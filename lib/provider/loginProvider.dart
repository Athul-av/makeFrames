import 'package:flutter/material.dart';
import 'package:makeframes/Services/api_service.dart';
import 'package:makeframes/constant/snackbar.dart';
import 'package:makeframes/models/login_request_model.dart';
import 'package:makeframes/screens/home/homesccreen.dart';

class LoginProvider with ChangeNotifier{

final emailController = TextEditingController();
final passwordController = TextEditingController();
bool isload =false;

Future<void> loginButtonclicked(context) async {
   isload =true;
  notifyListeners(); 
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final loguser = LoginreqModel(email: email, password: password);

    await ApiService().login(loguser).then((value) => {
          if (value!.isPass == true)
            {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false)
            }
          else
            {
              CustomSnackBar()
                  .snackBar(context, 'Invalid Username/Password',const Color.fromARGB(255, 138, 35, 28) )
            }
        });
    isload =false; 
  notifyListeners();
  }
}