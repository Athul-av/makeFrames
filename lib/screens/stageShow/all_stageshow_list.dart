import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/stageshow_item.dart';

class StageshowList extends StatelessWidget {
  const StageshowList({super.key});

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
          title: const Text(
            "Stage show",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 15),
              child: CupertinoSearchTextField(
                backgroundColor: Color.fromARGB(255, 38, 38, 38),
                placeholder: 'search',
                placeholderStyle: TextStyle(
                    color: Color.fromARGB(255, 172, 172, 172), fontSize: 15),
                itemColor: Color.fromARGB(255, 180, 180, 180),
                padding: EdgeInsets.all(13),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: GridView.builder(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 9.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: stageShowlist(context),
                  );
                },
                itemCount: 9,
              ),
            ),
          ],
        ));
  }
}
