import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/authentication/signup/provider/signup_provdr.dart';
import 'package:makeframes/authentication/signin/view/loginscreen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<SignUpProvdr>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: height(context, 0.21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create new account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: height(context, 0.013),
                ),
                const Text(
                  'Please fill in the form to continue',
                  style: TextStyle(
                      color: Color.fromARGB(255, 113, 113, 113), fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height(context, 0.73),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 1, bottom: 1),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: provider.userNameController,
                      cursorColor: color1(),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "enter username";
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
                          labelText: 'User Name',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 190, 190, 190)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 20,
                            color: Color.fromARGB(255, 221, 221, 221),
                          )),
                    ),
                    SizedBox(
                      height: height(context, 0.02),
                    ),
                    TextFormField(
                      controller: provider.emailController,
                      cursorColor: color1(),
                      keyboardType: TextInputType.emailAddress,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "enter your email";
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
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 190, 190, 190)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(
                            CupertinoIcons.mail_solid,
                            size: 20,
                            color: Color.fromARGB(255, 220, 220, 220),
                          )),
                    ),
                    SizedBox(
                      height: height(context, 0.02),
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      cursorColor: color1(),
                      obscureText: true,
                      validator: ((value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Password must have atleast 6 character";
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
                          labelText: 'password',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 190, 190, 190)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(
                            CupertinoIcons.lock_fill,
                            size: 20,
                            color: Color.fromARGB(255, 220, 220, 220),
                          )),
                    ),
                    SizedBox(
                      height: height(context, 0.02),
                    ),
                    Consumer<SignUpProvdr>(
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: provider.repasswordController,
                          cursorColor: color1(),
                          obscureText: value.obscure,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "re-enter your password";
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
                              labelText: 'Re-enter password',
                              labelStyle: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 190, 190, 190)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 38, 38, 38),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: const Icon(
                                CupertinoIcons.lock_fill,
                                size: 20,
                                color: Color.fromARGB(255, 220, 220, 220),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  value.visibility();
                                },
                                icon: Icon(
                                  value.obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:
                                      const Color.fromARGB(255, 159, 159, 159),
                                  size: 18,
                                ),
                                splashColor: Colors.transparent,
                              )),
                        );
                      },
                    ),
                    SizedBox(
                      height: height(context, 0.059),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            provider.getotp(context);
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(color1()),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(25)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Consumer<SignUpProvdr>(
                          builder: (context, value, child) {
                            return value.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  )
                                : const Text('Sign Up');
                          },
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an Account?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 207, 207, 207),
                                    fontSize: 13),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()));
                                            provider.disposeTextfield(); 
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Color.fromARGB(251, 5, 113, 74),
                                    ),
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
