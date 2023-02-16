import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    //   return Scaffold(
    //     resizeToAvoidBottomInset: false,
    //     backgroundColor: Colors.black,
    //     appBar: AppBar(
    //       elevation: 10,
    //       backgroundColor: color1(),
    //       shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(130),
    //               bottomRight: Radius.circular(260))),
    //       bottom: PreferredSize(
    //           preferredSize: const Size.fromHeight(147),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: const [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: 35),
    //                     child: Text(
    //                       '" To be an artist is ',
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 23),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const Padding(
    //                 padding: EdgeInsets.only(left: 64, top: 4),
    //                 child: Text(
    //                   'to believe in life "',
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 23),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: height(context, 0.11),
    //               )
    //             ],
    //           )),
    //     ),
    //     body: Padding(
    //       padding:
    //           const EdgeInsets.only(left: 32, right: 32, top: 89, bottom: 15),
    //       child: Form(
    //         autovalidateMode: AutovalidateMode.onUserInteraction,
    //         key: formKey,
    //         child: ListView(
    //           children: [
    //             TextFormField(
    //               controller: provider.emailController,
    //               cursorColor: color1(),
    //               keyboardType: TextInputType.emailAddress,
    //               validator: ((value) {
    //                 if (value!.isEmpty) {
    //                   return "enter your email";
    //                 } else {
    //                   return null;
    //                 }
    //               }),
    //               style: const TextStyle(color: Colors.white),
    //               decoration: InputDecoration(
    //                   focusedBorder: UnderlineInputBorder(
    //                     borderSide: BorderSide(color: color1(), width: 2),
    //                   ),
    //                   labelText: 'Enter Email',
    //                   labelStyle: const TextStyle(
    //                       fontSize: 13,
    //                       color: Color.fromARGB(255, 190, 190, 190)),
    //                   filled: true,
    //                   fillColor: const Color.fromARGB(255, 38, 38, 38),
    //                   prefixIcon: const Icon(
    //                     CupertinoIcons.mail_solid,size: 20,
    //                     color: Color.fromARGB(255, 221, 221, 221),
    //                   )),
    //             ),
    //             SizedBox(
    //               height: height(context, 0.03),
    //             ),
    //             Consumer<LoginProvider>(
    //               builder: (context, value, child) {
    //                 return  TextFormField(
    //                 controller: provider.passwordController,
    //                 cursorColor: color1(),
    //                 obscureText: value.obscure,
    //                 validator: ((value) {
    //                   if (value!.isEmpty) {
    //                     return "enter your password";
    //                   } else {
    //                     return null;
    //                   }
    //                 }),
    //                 style: const TextStyle(color: Colors.white),
    //                 decoration: InputDecoration(
    //                     focusedBorder: UnderlineInputBorder(
    //                       borderSide: BorderSide(color: color1(), width: 2),
    //                     ),
    //                     labelText: 'Enter password',
    //                     labelStyle: const TextStyle(
    //                         fontSize: 13,
    //                         color: Color.fromARGB(255, 190, 190, 190)),
    //                     filled: true,
    //                     fillColor: const Color.fromARGB(255, 38, 38, 38),
    //                      prefixIcon: const Icon(
    //                     CupertinoIcons.lock_fill,size: 20,
    //                     color: Color.fromARGB(255, 221, 221, 221),
    //                   ),
    //                     suffixIcon:  IconButton(
    //                       onPressed:() {
    //                         value.visibility();
    //                       },
    //                       icon:value.obscure? const Icon( Icons.visibility,size: 18,
    //                       color: Color.fromARGB(255, 169, 169, 169),
    //                       ):const Icon( Icons.visibility_off, size: 18,
    //                       color: Color.fromARGB(255, 169, 169, 169),
    //                       ),
    //                       splashColor: Colors.transparent,
    //                       )
    //                     ),
    //               );
    //               },
    //             ),
    //             SizedBox(
    //               height: height(context, 0.149 ),
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   if (formKey.currentState!.validate()) {
    //                     provider.loginButtonclicked(context);
    //                   }
    //                 },
    //                 style: ButtonStyle(
    //                     backgroundColor: MaterialStateProperty.all(color1()),
    //                     padding:
    //                         MaterialStateProperty.all(const EdgeInsets.all(13)),
    //                     textStyle: MaterialStateProperty.all(const TextStyle(
    //                         fontSize: 17, fontWeight: FontWeight.bold))),
    //                 child: Consumer<LoginProvider>(
    //                   builder: (context, value, child) {
    //                   return
    //                   value.isload?const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,):
    //                   const Text('LOGIN');
    //                   },
    //                   )),
    //             const SizedBox(
    //               height: 12,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Container(
    //                   height: height(context, 0.0014),
    //                   color: Colors.grey,
    //                   width: width(context, 0.36),
    //                 ),
    //                 const Text(
    //                   'OR',
    //                   style: TextStyle(color: Colors.grey),
    //                 ),
    //                 Container(
    //                   height: height(context, 0.0014),
    //                   color: Colors.grey,
    //                   width: width(context, 0.36),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 12 ,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.of(context).pushReplacement(
    //                       MaterialPageRoute(builder: (_) => SignupScreen()));
    //                 },
    //                 style: ButtonStyle(
    //                     shape: MaterialStateProperty.all(
    //                       RoundedRectangleBorder(
    //                         side: BorderSide(width: 2, color: color1()),
    //                       ),
    //                     ),
    //                     backgroundColor: MaterialStateProperty.all(Colors.black),
    //                     padding:
    //                         MaterialStateProperty.all(const EdgeInsets.all(14)),
    //                     textStyle: MaterialStateProperty.all(const TextStyle(
    //                         fontSize: 16, fontWeight: FontWeight.bold))),
    //                 child: const Text('SIGNUP')),
    //             const Align(
    //                 alignment: Alignment.center,
    //                 child: Padding(
    //                   padding: EdgeInsets.all(4.0),
    //                   child: Text(
    //                     'if you are a new user please signup',
    //                     style: TextStyle(
    //                         color: Color.fromARGB(255, 170, 170, 170),
    //                         fontSize: 11),
    //                   ),
    //                 ))
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

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
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: height(context, 0.013),
                  ),
                  const Text(
                    'Please sign in to your account',
                    style: TextStyle(
                        color: Color.fromARGB(255, 113, 113, 113),
                        fontSize: 13),
                  ),
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
                            labelText: 'Enter Email',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 190, 190, 190)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 38, 38, 38),
                            prefixIcon: const Icon(
                              CupertinoIcons.mail_solid,
                              size: 20,
                              color: Color.fromARGB(255, 221, 221, 221),
                            )),
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
                            children: const [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 239, 239, 239),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/google.png')),
                              ),
                              Text(
                                'Sign In with Google',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an Account?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 13),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => SignupScreen()));
                                    },
                                    child: const Text(
                                      'Sign Up',
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
            )
          ],
        ),
      ),
    );
  }
}