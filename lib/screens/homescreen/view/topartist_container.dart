import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/artist_profile2.dart';

Widget topartistContainer(context) {
  return Container(
    width: width(context, 0.32),
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 25, 25, 25),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: Color.fromARGB(255, 25, 25, 25),
            backgroundImage: AssetImage('assets/images/user2.png'),
            // child: Image(
            //   fit: BoxFit.cover,
            //   image: AssetImage('assets/images/user2.png')),
          ),
          const Text(
            'Athul',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color1()),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)))),
              onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ArtistProfileScreen2())); 
              },
              child: const Text(
                'Show profile',
                style: TextStyle(
                    fontSize: 10 , color: Color.fromARGB(255, 231, 231, 231)),
              ))
        ],
      ),
    ),
  );
}
