
import 'package:flutter/material.dart';

import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/screens/bottomnav/bottomnavscreen.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:scaffoldback,   
     appBar: AppBar(
     
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () { 
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> BottomNavigationScreen()), (route) => false);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row( 
          children:const [
           Icon(Icons.add,size: 16,),  
            Text(' Post',style: TextStyle(fontWeight: FontWeight.bold ),),

          ],
        ),
        backgroundColor:color1(),   
        elevation: 5 ,
       
       
        onPressed: () {
      },
      ), 
      body: ListView( 
        shrinkWrap: true, 
        children: [
          Container(
            decoration:const BoxDecoration(
               color:Colors.black,
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30) )   
            ),
           
            height: height(context, 0.38 ),
            child: Column(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: Stack(
                        alignment: Alignment.bottomRight, 
                         children: [  const 
                         CircleAvatar(
                          radius: 67,
                          backgroundColor:Color.fromARGB(255, 0, 0, 0) ,
                         
                          backgroundImage: AssetImage('assets/images/user2.png'), ),

                       InkWell(
                          onTap: () {
                         
                           },
                          child:const CircleAvatar(
                            radius: 23,  
                            backgroundColor: Color.fromARGB(255, 29, 29, 29), 
                            foregroundColor: Colors.white, 
                            child: Icon(Icons.add_a_photo),
                          ),
                        )
                    ] ),
                     ),
                    const Padding(
                      padding: EdgeInsets.only(top: 13.0, bottom: 13),
                      child: Text(
                        'Athul Av',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                      children: [
                         ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromARGB(255, 155, 35, 27))),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30, top: 15, bottom: 15),
                            child: Text('To stage ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                          )), 
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(color1())),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30, top: 15, bottom: 15), 
                            child: Text('Message',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),

                          )), 
                        
                    ],),
                  )
                  ],
                ),
          ),
        // Expanded(
        //   child:ListView.separated(
        //   shrinkWrap: true,
        //   physics: ScrollPhysics(), 
              
        //     itemBuilder: (context, index) {
        //       return Container(
        //         color: Colors.teal, 
        //         height: 60 ,
        //       ); 
        //     }, separatorBuilder: (context, index) {
        //       return SizedBox(height: 10,);
        //     }, itemCount: 9) ) 
      hsizedbox(context, 0.2),
      const Align(
        
        child: Text('No Posts!',
        style: TextStyle(
          fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white) )) , 
          hsizedbox(context, 0.28),
        ],
      ),
    );
  }
}