import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/auth_textfield.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/authentication/signin/provider/loginprovider.dart';
import 'package:makeframes/authentication/signup/view/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boldtext('Welcome', Colors.white, 21),
                  SizedBox(
                    height: height(context, 0.013),
                  ),
                  normaltext('Please sign in to your account',
                      const Color.fromARGB(255, 113, 113, 113), 13)
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 1, bottom: 15),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: ListView(
                    children: [
                      AuthenticationTextField(
                        controller: provider.emailController,
                        color: color1(),
                        keyboard: TextInputType.emailAddress,
                        label: 'Enter Email',
                        validatormssg: "enter your email",
                        prefix: const Icon(
                          CupertinoIcons.mail_solid,
                          size: 20,
                          color: Color.fromARGB(255, 221, 221, 221),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.02),
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) {
                          return TextFormField(
                            controller: provider.passwordController,
                            cursorColor: color1(),
                            obscureText: value.obscure,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return "enter your password";
                              } else {
                                return null;
                              }
                            }),
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(25),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                labelText: 'Enter password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 190, 190, 190)),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 38, 38, 38),
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock_fill,
                                  size: 20,
                                  color: Color.fromARGB(255, 221, 221, 221),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.obscure
                                      ? const Icon(
                                          Icons.visibility,
                                          size: 19,
                                          color: Color.fromARGB(
                                              255, 169, 169, 169),
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          size: 19,
                                          color: Color.fromARGB(
                                              255, 169, 169, 169),
                                        ),
                                  splashColor: Colors.transparent,
                                )),
                          );
                        },
                      ),
                      SizedBox(
                        height: height(context, 0.149),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              provider.loginButtonclicked(context);
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(color1()),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(25)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: Consumer<LoginProvider>(
                            builder: (context, value, child) {
                              return value.isload
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : const Text('Sign In');
                            },
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 239, 239, 239)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(13)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 239, 239, 239),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/google.png')),
                              ),
                              normaltext(
                                  'Sign In with Google', Colors.black, 15)
                            ],
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                normaltext(
                                    "Don't have an Account?",
                                    const Color.fromARGB(255, 207, 207, 207),
                                    13),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => SignupScreen()));
                                    },
                                    child: normaltext(
                                        'Sign Up',
                                        const Color.fromARGB(251, 5, 113, 74),
                                        15))
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
