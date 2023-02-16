import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:provider/provider.dart';

class ArtistProfileScreen extends StatefulWidget {
  const ArtistProfileScreen({super.key});

  @override
  State<ArtistProfileScreen> createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    final providerSplash = Provider.of<SplashProvider>(context, listen: false);
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
        label: Row(
          children: const [
            Icon(
              Icons.add,
              size: 16,
            ),
            Text(
              ' Post',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: color1(),
        elevation: 5,
        onPressed: () {},
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            height: height(context, 0.365),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    image != null
                        ? CircleAvatar(
                            radius: 67,
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            backgroundImage: FileImage(image!),

                            //  AssetImage('assets/images/user2.png')
                          )
                        : const CircleAvatar(
                            radius: 67,
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            backgroundImage:
                                AssetImage('assets/images/user2.png')),
                    InkWell(
                      onTap: () async {
                        getImage();
                      },
                      child: const CircleAvatar(
                        radius: 23,
                        backgroundColor: Color.fromARGB(255, 29, 29, 29),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.add_a_photo),
                      ),
                    )
                  ]),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          hsizedbox(context, 0.28),
        ],
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final tempImg = File(image.path);
    setState(() {
      this.image = tempImg;
    });
  }
}
