import 'package:flutter/material.dart';
import 'package:makeframes/screens/homescreen&search/provider/hype_provider.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:makeframes/services/allusersPosts/alluserspost_service.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/model/alluser_resp.dart';
import 'package:makeframes/screens/message/message_screen.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/view/postedimage_screen.dart';
import 'package:provider/provider.dart';

class ArtistProfileScreen2 extends StatelessWidget {
  ArtistProfileScreen2({super.key, required this.userdetails, this.artistid});

  AllUsersDetailsRes userdetails;
  String? artistid;
  @override
  Widget build(BuildContext context) {
    // log(userdetails.id.toString());
Provider.of<HypeProvider>(context,listen: false).updatehype(userdetails.id!); 
    String? token = Provider.of<SplashProvider>(context, listen: false).logincheck;
    final providerhype = Provider.of<HypeProvider>(context, listen: false);
 String? userid = Provider.of<DpGetProvider>(context,listen: false).data!.id;
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
                  child: Stack(alignment: Alignment.topRight, children: [
                  
                    userdetails.dpimage == null
                        ? const CircleAvatar(
                            radius: 64,
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            backgroundImage:
                                AssetImage('assets/images/user2.png'))
                        : CircleAvatar(
                            radius: 64,
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            backgroundImage: NetworkImage(userdetails.dpimage!),
                            
                          ),
                    InkWell(
                      onTap: () {},
                      child: Consumer<HypeProvider>(
                        builder: (context, value, child) {
                          return  CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color.fromARGB(255, 155, 35, 27),
                          child: Text(
                           value.hype!.length.toString(),  
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ); 
                        },
                      
                      ),
                    )
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 13.0, bottom: 3),
                    child: boldtext(userdetails.firstName!, Colors.white, 21)),
                normaltext(userdetails.domain!,
                    const Color.fromARGB(255, 172, 172, 172), 13),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 155, 35, 27))),
                          onPressed: () async {
                            await providerhype.givehype(
                                userdetails.id!, context); 
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30, top: 11, bottom: 11),
                              child: boldtext('Give hype ', Colors.white, 14))),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(color1())),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => MessageScreen(
                                      dpimage: userdetails.dpimage,artistid: artistid, userid:userid
                                    )));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30, top: 11, bottom: 11),
                              child: boldtext(' Message ', Colors.white, 14))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: AllPostOfUsers().getuserpost(token!, userdetails.id!),
            builder: (context, snapshot) {
              if (snapshot.hasData || snapshot.data != null) {
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
                              builder: (_) => PostedImageorVideoScreen(
                                  image: snapshot.data![index].images![0],
                                  comment: snapshot.data![index].coments!)));
                        },
                        child: Container(
                          color: const Color.fromARGB(255, 65, 65, 65),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.data![index].images![0])),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length);
              } else {
                return Center(child: boldtext("no posts", Colors.white, 14));
              }
            },
          ))
        ]));
  }
}
