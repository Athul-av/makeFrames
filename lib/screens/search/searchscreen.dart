import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/constant/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 3,
        title: Container(
          width: width(context, 0.4),
          height: height(context, 0.066),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Makeframes2.png'))),
        ),), 
body: const Padding(
  padding:  EdgeInsets.all(13.0),
  child:   CupertinoSearchTextField(
  backgroundColor:  Color.fromARGB(255, 38, 38, 38),
    placeholder: 'search',
    placeholderStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172),fontSize: 15),
    itemColor: Color.fromARGB(255, 180, 180, 180),
   
    padding: EdgeInsets.all(13),
   
    style: TextStyle(color: Colors.white), 

  
  ),
)  ,
    );
  }
}
