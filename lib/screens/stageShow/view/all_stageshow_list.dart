import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/provider/allstageshow_provider.dart';
import 'package:makeframes/screens/stageShow/view/stageshow_item.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<AllStageShowProvider>(
          builder: (context, value, child) {
            return  Column(
            children: [
               Padding(
                padding:
                   const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 15),
                child: CupertinoSearchTextField(
                  backgroundColor:const Color.fromARGB(255, 38, 38, 38),
                  placeholder: 'search',
                  placeholderStyle: const TextStyle(
                      color: Color.fromARGB(255, 172, 172, 172), fontSize: 15),
                  itemColor:const Color.fromARGB(255, 180, 180, 180),
                  padding:const EdgeInsets.all(13),
                  style:const TextStyle(color: Colors.white),
                  onChanged: (result) =>  value.search(result),
               
                ),
              ),
              Expanded(
               
                  
                       child: GridView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 7.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: stageShowlist(context,
                       value.data![index].name, 
                        value.data![index].imageArray![0],
                        value.data![index].category), 
                      );  
                    },
                    itemCount: value.data!.length, 
                  )
                    
                   
                
              ),
            ],
          );
          },
        
        ));
  }
}
