// ignore_for_file: library_prefixes

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageScreen extends StatefulWidget {
   MessageScreen({super.key,this.dpimage});
 
  String? dpimage;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  
  IO.Socket? socket; 


  @override
  void initState() {
    super.initState();
    connect();
  }


  void connect(){
    socket = IO.io("http://10.4.3.192:3033",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket!.connect(); 
    socket!.onconnect((data)=> log("connected"));     
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          'Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions:  [
          Padding(
            padding:const EdgeInsets.only(right: 16.0),
            child: 
            widget.dpimage != null?
             CircleAvatar( 
              radius: 23,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(widget.dpimage!),
            ):
           const CircleAvatar(
              radius: 23,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/user2.png'),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height(context, 0.8),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: const [],
              ),
            ),
          ),
          TextField(
            cursorColor: color1(),
            keyboardType: TextInputType.multiline,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(17),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                labelText: 'message',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 190, 190, 190)),
                filled: true,
                fillColor: const Color.fromARGB(255, 38, 38, 38),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 25,
                      color: Color.fromARGB(255, 169, 169, 169),
                    ),
                    splashColor: Colors.transparent,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
