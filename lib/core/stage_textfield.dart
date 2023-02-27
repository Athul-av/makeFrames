
import 'package:flutter/material.dart';

class CreateStageTextField extends StatelessWidget {
  CreateStageTextField(
      {super.key,
       this.controller,
       this.cursorcolor,
       this.validatormessage,
       this.label,
       this.maxlines, 
      required this.keyboardtype,
      required this.contentpadding
      });

  TextEditingController? controller;
  Color? cursorcolor;
  String? validatormessage;
  String? label;
  TextInputType keyboardtype;
  int? maxlines;
  double contentpadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      cursorColor: cursorcolor,
      keyboardType: keyboardtype,
      validator: ((value) {
        if (value!.isEmpty) {
          return validatormessage;
        } else {
          return null;
        }
      }),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding:  EdgeInsets.all(contentpadding),
          alignLabelWithHint: true,  
          border: OutlineInputBorder(
            
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          labelText: label,
          
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
              fontSize: 13, color: Color.fromARGB(255, 190, 190, 190)),
          filled: true,
          fillColor: const Color.fromARGB(255, 38, 38, 38),
         
          ),
    );
  }
}
