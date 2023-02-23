import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/provider/all_post_provider.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:makeframes/screens/userprofile/provider/profile_photo.dart';
import 'package:makeframes/screens/userprofile/view/post_screen.dart';
import 'package:makeframes/screens/userprofile/view/postedimage_screen.dart';
import 'package:makeframes/screens/userprofile/view/tostage_screen.dart';
import 'package:provider/provider.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final providerSplash = Provider.of<SplashProvider>(context, listen: false);
    final providerPicker =Provider.of<ProfilePicProvidr>(context, listen: false);

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
              .push(MaterialPageRoute(builder: (_) => const PostScreen()));
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
                Consumer<DpGetProvider>(builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      value.data != null
                          ? CircleAvatar(
                              radius: 67,
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              backgroundImage: NetworkImage(value.data!),
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
                }),
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
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const ToStageScreen()));
                          },
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
          Expanded(child: Consumer<AllPostProvider>(
            builder: (context, value, child) {
              if (value.data != null) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => PostedImageorVideoScreen(
                                  image: value.data![index].images![0],
                                  comment: value.data![index].coments!,
                                ))));
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 65, 65, 65),
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(value.data![index].images![0])),
                      ),
                    );
                  },
                  itemCount: value.data!.length,
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
          ))
        ],
      ),
    );
  }
}
