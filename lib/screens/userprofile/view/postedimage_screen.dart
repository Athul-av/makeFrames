import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';

class PostedImageorVideoScreen extends StatelessWidget {
  PostedImageorVideoScreen(
      {super.key, required this.image, required this.comment});

  String image;
  String comment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: height(context, 0.56),
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 231, 229, 229),
            child: Image(image: NetworkImage(image)),
          ),
          SizedBox(
            height: height(context, 0.02),
            width: MediaQuery.of(context).size.width,
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: normaltext('13-03-2023',
                      const Color.fromARGB(255, 189, 189, 189), 13),
                )),
          ),
          SizedBox(
            height: height(context, 0.19),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SingleChildScrollView(
                  child: Text(comment,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}
