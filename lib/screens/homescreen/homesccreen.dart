import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/screens/userprofile/normal_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 3,
        title: Container(
          width: width(context, 0.4),
          height: height(context, 0.066),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Makeframes2.png'))),
        ),
        actions: [
          CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              radius: 19,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const NormalUser())));
                  },
                  icon: const Icon(CupertinoIcons.person_alt_circle_fill))),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.chat_bubble_text_fill)),
          ),
        ],
      ),
    );
  }
}
