import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/model/alluser_resp.dart';
import 'package:makeframes/screens/homescreen&search/view/artist_profile2.dart';

class TopArtistsContainer extends StatelessWidget {
  TopArtistsContainer(
      {super.key, required this.name, this.dpimage, required this.userdata});

  String name;
  String? dpimage;
  AllUsersDetailsRes userdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, 0.32),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 25, 25, 25),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dpimage != null
                ? CircleAvatar(
                    radius: 36, backgroundImage: NetworkImage(dpimage!))
                : const CircleAvatar(
                    radius: 36,
                    backgroundColor: Color.fromARGB(255, 25, 25, 25),
                    foregroundColor: Color.fromARGB(255, 130, 130, 130),
                    child: Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      size: 77,
                    )),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color1()),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          ArtistProfileScreen2(userdetails: userdata,artistid: userdata.id,)));
                },
                child: const Text(
                  'Show profile',
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(255, 231, 231, 231)),
                ))
          ],
        ),
      ),
    );
  }
}
