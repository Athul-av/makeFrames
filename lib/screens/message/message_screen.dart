// ignore_for_file: library_prefixes
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/view/message_model.dart';
import 'package:makeframes/screens/message/replaycard.dart';
import 'package:makeframes/screens/message/sendcard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key, this.dpimage,this.artistid,this.userid});

  String? dpimage;
  String?  artistid;
  String?  userid;
List<mssgmodel> msg =[];


  @override
  State<MessageScreen> createState() => _MessageScreenState(); 
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController mssgcontroller = TextEditingController();
  late IO.Socket socket; 

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.disconnect();
    socket.emit("disconnect",widget.userid);  
    socket.close();  
  }
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() { 
    socket = IO.io("http://10.4.3.192:3033", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    }); 
   
    socket.connect();
    socket.emit("addUser",widget.userid); 
    socket.on("receive", (data) {
      setmssg("getmessg", data["message"]); 
      setState(() {
         
      });
    }); 
    
  }

  @override
  Widget build(BuildContext context) {
   log(widget.artistid.toString()); 
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: widget.dpimage != null
                ? CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(widget.dpimage!),
                  )
                : const CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/user2.png'),
                  ),
          ),
        ],
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: [

          Expanded(
            child:
            widget.msg.isEmpty?
            Center(child: normaltext('no chat', Colors.white, 15),):
             Padding(
              padding: const EdgeInsets.all(15),  
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if(widget.msg[index].type == "sendmssg"){
                    return sendcard(context, widget.msg[index].message!);
                  }else{
                    return replaycard(context,  widget.msg[index].message!);  
                  } 
                },    
              itemCount: widget.msg.length, 
              ), 
            ),
          ),
          TextField(
            controller: mssgcontroller,
            cursorColor: color1(),
            keyboardType: TextInputType.multiline,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(17),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Type message',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 190, 190, 190)),
                filled: true,
                fillColor: const Color.fromARGB(255, 38, 38, 38),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      if(mssgcontroller.text.isEmpty){
                        return ; 
                      }else{
                        sendmessage(mssgcontroller.text.trim());
                        mssgcontroller.clear();   
                      }
                    },
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

  void sendmessage (String mssg){
setmssg("sendmssg", mssg);
 socket.emit("send-msg",{"to":widget.artistid,"from":widget.userid,"message":mssg});
 log('messaged'); 

 
  }

  void setmssg (String type,String message){
mssgmodel model = mssgmodel(message: message,type: type);
setState(() {
  setState(() {
     widget.msg.add(model);
  });
 
});
  }
}
