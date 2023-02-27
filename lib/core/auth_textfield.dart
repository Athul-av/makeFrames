import 'package:flutter/material.dart';


class AuthenticationTextField extends StatelessWidget {
   AuthenticationTextField({super.key,required this.controller,this.color,this.validatormssg,this.label,this.prefix,this.keyboard});

  TextEditingController  controller; 
  Color? color;
  String? validatormssg;
  String? label;
  Widget? prefix;
  TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                        controller: controller,
                        cursorColor: color,
                        keyboardType:keyboard,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return validatormssg;
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
                            labelText: label,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 190, 190, 190)),
                            filled: true, 
                            fillColor: const Color.fromARGB(255, 38, 38, 38),
                            prefixIcon:prefix
                            ),
                      ); 
    
 }
}