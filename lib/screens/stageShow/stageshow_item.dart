import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';

Widget stageShowlist(context) {
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
            height: 95,
            width: 135,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/stage2.png'))),
          ),
          const Text(
            'Name',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
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
