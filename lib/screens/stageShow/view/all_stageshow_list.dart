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

          title: boldtext("Stage shows", Colors.white , 21),
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
                  placeholderStyle:const TextStyle(
                  color: Color.fromARGB(255, 172, 172, 172), fontSize: 15),
                  itemColor:const Color.fromARGB(255, 180, 180, 180),
                  padding:const EdgeInsets.all(13),
                  style:const TextStyle(color: Colors.white),
                  onChanged: (result) =>  value.search(result),
               
                ),
              ),
              Expanded(
               
                    child:
                    value.data == null || value.data!.isEmpty ? 
                    Center(child: boldtext('No Stage show', Colors.white, 13),):
                        ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                  
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10,top: 5,bottom: 5),
                        child: Showcontainer(value: value.data![index]), 
                      );  
                    },
                    itemCount: value.data!.length, 
                  )
                    
                   
                
              )  
             
            ],
          );
          },
        
        ));
  }
}
