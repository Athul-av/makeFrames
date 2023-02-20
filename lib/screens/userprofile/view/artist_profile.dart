

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeframes/Services/AllPosts/all_post_service.dart';
import 'package:makeframes/Services/profilePicService/bring_profilepic.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/model/all_post_res.dart';

import 'package:makeframes/screens/userprofile/provider/profile_photo.dart';
import 'package:makeframes/screens/userprofile/view/post_screen.dart';
import 'package:provider/provider.dart';

class ArtistProfileScreen extends StatefulWidget {
  const ArtistProfileScreen({super.key});

  @override
  State<ArtistProfileScreen> createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
 

  @override
  Widget build(BuildContext context) {

    final providerSplash = Provider.of<SplashProvider>(context, listen: false);
    final providerPicker =
        Provider.of<ProfilePicProvidr>(context, listen: false);
    final String? token =  
        Provider.of<SplashProvider>(context, listen: false).logincheck;

    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => BottomNavigationScreen()),
                  (route) => false);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Icon(
          Icons.add,
          size: 23,
        ),
        backgroundColor: color1(),
        elevation: 5,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => PostScreen()));
        },
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            height: height(context, 0.365),
            child: Column(
              children: [
                FutureBuilder<String?>(
                  future: BringProfilePicService().bringDP(token!),
                  builder: (context,snapshot) {      
                      

                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                           
                      snapshot.hasData && snapshot.connectionState == ConnectionState.done 

                            ? CircleAvatar(
                                radius: 67,
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                backgroundImage: NetworkImage(snapshot.data!), 
                                //  AssetImage('assets/images/user2.png')
                              )
                            : const CircleAvatar(
                                radius: 67,
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                backgroundImage:
                                    AssetImage('assets/images/user2.png')),
                        InkWell(
                          onTap: () async {
                            providerPicker.getImage(context);
                          },
                          child: const CircleAvatar(
                            radius: 23,
                            backgroundColor: Color.fromARGB(255, 29, 29, 29),
                            foregroundColor: Colors.white,
                            child: Icon(Icons.add_a_photo),
                          ), 
                        )
                      ]),
                    );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0, bottom: 13),
                  child: Text(
                    providerSplash.username,
                    style: const TextStyle(
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
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 155, 35, 27))),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30, top: 11, bottom: 11),
                            child: Text('To stage ',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(color1())),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30, top: 11, bottom: 11),
                            child: Text(
                              'Message',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<AllPostRes>?>(  
            future: AllPostService().getallpost(token), 
            builder: (context, snapshot) {
              log(snapshot.data.toString());   

              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
 
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150, 
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 2,  
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      color: const Color.fromARGB(255, 65, 65, 65),
                    );
                  }, 
                  itemCount: snapshot.data!.length,
                );

              } else {
                 
                return const Center( 
                  child: Text(
                    'No Post',
                    style: TextStyle(color: Colors.white),
                  ),
                );  
              }
            },
          )  
          )
         
        ],
      ),
    );
  }
}
