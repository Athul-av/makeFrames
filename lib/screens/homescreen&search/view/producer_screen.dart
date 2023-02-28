import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/provider/alluser_provider.dart';
import 'package:makeframes/screens/homescreen&search/view/artist_profile2.dart';
import 'package:provider/provider.dart';

class ProducerScreen extends StatelessWidget {
  const ProducerScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar:  AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              title: boldtext('Producers', Colors.white, 20),
              centerTitle: true,
        ),
        body:  Consumer<AllUserProvider>(
          builder: (context, value, child) {
            if(value.producers.isEmpty){
             return Center(child: boldtext("No producers", Colors.white, 15),);
            } 
            else{
              return Padding(
                  padding: const EdgeInsets.fromLTRB(3,10,3,5), 
                    child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                             maxCrossAxisExtent: width(context, 0.37),
                             mainAxisExtent: height(context, 0.225),
                             crossAxisSpacing: 5,
                             mainAxisSpacing: 15),
                         itemBuilder: (context, index) {
                           return Container(
                             decoration: const BoxDecoration(
                                 color: Color.fromARGB(255, 25, 25, 25),
                                 borderRadius:
                                     BorderRadius.all(Radius.circular(8))),
                             child: Padding(
                               padding: const EdgeInsets.all(6.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                    CircleAvatar(
                                     radius: 36,
                                     backgroundColor:
                                        const Color.fromARGB(255, 25, 25, 25),
                                     foregroundColor:const Color.fromARGB(255, 130, 130, 130),
                                     child: 
                                     value.producers[index].dpimage != null ? 
                                     Padding(
                                       padding: const EdgeInsets.only(top:3.0),
                                       child: ClipOval( 
                                         child: 
                                         Image(
                                           image: NetworkImage(value.producers[index].dpimage!)),
                                       ),
                                     ):
                                   const Icon(CupertinoIcons.person_alt_circle_fill,size: 77,)
                                    ),
                             
                                   Padding(
                                     padding: const EdgeInsets.only(top:8.0),
                                     child: Text(
                                       value.producers[index].firstName!,
                                       style: const TextStyle(
                                           color: Colors.white,
                                           fontSize: 16,
                                           fontWeight: FontWeight.bold,
                                           overflow: TextOverflow.ellipsis),
                                     ),
                                   ),
                                   normaltext(
                                      value.producers[index].domain!,
                                       const Color.fromARGB(255, 140, 140, 140),
                                       11),
                                   ElevatedButton(
                                       style: ButtonStyle(
                                           backgroundColor:
                                               MaterialStateProperty.all(color1()),
                                           shape: MaterialStateProperty.all(
                                               RoundedRectangleBorder(
                                                   borderRadius:
                                                       BorderRadius.circular(
                                                           12.0)))),
                                       onPressed: () {
                                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ArtistProfileScreen2(userdetails: value.producers[index],)));  
                                       },
                                       child: const Text(
                                         'Show profile',
                                         style: TextStyle(
                                             fontSize: 10,
                                             color: Color.fromARGB(
                                                 255, 231, 231, 231)),
                                       ))
                                 ],
                               ),
                             ),
                           );
                         },
                         itemCount:value.producers.length, 
                       ),
          );
            }
           
          },
           
        ),
    );
  }
}