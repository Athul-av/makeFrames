import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:makeframes/screens/userprofile/view/beartist_form.dart';
import 'package:makeframes/screens/userprofile/view/messagelist.dart';
import 'package:provider/provider.dart';


class NormalUserProfile extends StatelessWidget {
  const NormalUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
  final alldata = Provider.of<DpGetProvider>(context,listen: false).data;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/user2.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 25),
                      child: Text(
                        alldata!.firstName!, 
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(color1())),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const MessageListScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30, top: 14, bottom: 14),
                          child: Text('Message'),
                        )),
                  ],
                ),
              ),
            )),
            SizedBox(
                height: height(context, 0.2),
                child: Column(
                  children: [
                    const Text(
                      '''Do you want to be an artist ? please turn on
                          the artist mode !''',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const BeAnartistForm()));
                        },

                        child: boldtext('Artist Mode', color1(), 16),
                        )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
