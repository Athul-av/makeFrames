import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';

Widget stageShowlist(context, name, image,category) {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 24, 24, 24),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 92,
            width: 135,
            decoration:  BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover, 
                    image: NetworkImage(image))),
          ),

           Padding(
             padding: const EdgeInsets.only(top: 4), 
             child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style:const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
           ),
          Text(category,style: TextStyle(color: Color.fromARGB(255, 184, 184, 184),fontSize: 9),),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color1()),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)))),
              onPressed: () {},
              child: const Text(
                ' More details ',
                style: TextStyle(
                    fontSize: 11, color: Color.fromARGB(255, 231, 231, 231)), 
              ))
        ],
      ),
    ),
  );
}
