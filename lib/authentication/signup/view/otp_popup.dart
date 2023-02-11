import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/authentication/signup/provider/signup_provdr.dart';
import 'package:provider/provider.dart';

Future<void> displayTextInputDialog(BuildContext context) async {
  GlobalKey<FormState> key = GlobalKey();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Enter OTP'),
            content: Form(
              key: key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter your otp";
                  } else {
                    return null;
                  }
                },
                controller: Provider.of<SignUpProvdr>(context, listen: false)
                    .otpController,
                decoration: const InputDecoration(
                    hintText: "enter the otp from email",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: color1()),
                    child: const Text('SUBMIT'),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        Provider.of<SignUpProvdr>(context, listen: false)
                            .signupButtonPress(context);
                        log('hiii');
                      }
                    }),
              )
            ]);
      });
}
