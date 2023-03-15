
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';

Widget sendcard(context,String mssg){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight, 
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width(context, 0.7)),
            child: Container( 
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 11, 71, 51),
                borderRadius: BorderRadius.all(Radius.circular(5 ))
              ), 
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: normaltext(mssg, Colors.white, 15),
              ),
            ),
            
          ), 
        ),
        hsizedbox(context, 0.015)
      ],
    );
}