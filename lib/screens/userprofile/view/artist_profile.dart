import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/bottomnav/view/bottomnavscreen.dart';
import 'package:makeframes/screens/settingsscreen/signoutdialog.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/provider/all_post_provider.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:makeframes/screens/userprofile/provider/profile_photo.dart';
import 'package:makeframes/screens/userprofile/view/post_screen.dart';
import 'package:makeframes/screens/userprofile/view/postedimage_screen.dart';
import 'package:makeframes/screens/userprofile/view/postvideo_screen.dart';
import 'package:makeframes/screens/userprofile/view/tostage_screen.dart';
import 'package:provider/provider.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPicker =
        Provider.of<ProfilePicProvidr>(context, listen: false);
    final provideralldata = Provider.of<DpGetProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => BottomNavigationScreen()),
            (route) => false);
        return false;
      },
      child: Scaffold(
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
            showDialog(
                context: context,
                builder: ((context) {
                  return PlaceholderDialog(
                    message: 'what kind of media you want to post ?',
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.image),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const PostScreen()));
                                },
                                child: const Text("image")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.video_camera_back),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const PostVideoScreen()));
                                },
                                child: const Text("video")),
                          ],
                        ),
                      ),
                    ],
                  );
                }));
          },
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              height: height(context, 0.376),
              child: Column(
                children: [
                  Consumer<DpGetProvider>(
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          value.data!.dpimage == null
                              ? const CircleAvatar(
                                  radius: 62,
                                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                  backgroundImage:
                                      AssetImage('assets/images/user2.png'))
                              : CircleAvatar(
                                  radius: 62,
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  backgroundImage:
                                      NetworkImage(value.data!.dpimage!),
                                  //  AssetImage('assets/images/user2.png')
                                ),
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
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: boldtext(
                        provideralldata.data!.firstName!, Colors.white, 23),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 10),
                    child: normaltext(provideralldata.data!.domain!,
                        const Color.fromARGB(255, 186, 186, 186), 10),
                  ),
                  Consumer<AllPostProvider>(
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              normaltext(value.data!.length.toString(),
                                  Colors.white, 14),
                              hsizedbox(context, 0.003),
                              boldtext('Posts', Colors.white, 14)
                            ],
                          ),
                          Column(
                            children: [
                              normaltext(
                                  provideralldata.data!.hype!.length.toString(),
                                  Colors.white,
                                  14),
                              hsizedbox(context, 0.003),
                              boldtext('Hype', Colors.white, 14)
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 5),
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
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30, top: 9, bottom: 9),
                                child: boldtext('To stage', Colors.white, 14))),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(color1())),
                            onPressed: () {},
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30, top: 9, bottom: 9),
                                child: boldtext('Message', Colors.white, 14))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Consumer<AllPostProvider>(
              builder: (context, value, child) {
                if (value.data == null || value.data!.isEmpty) {
                  return Center(child: boldtext('No Post', Colors.white, 13));
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
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
                              image:
                                  NetworkImage(value.data![index].images![0])),
                        ),
                      );
                    },
                    itemCount: value.data!.length,
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
