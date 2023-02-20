import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
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
                  children:const[
                   
                  ],
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
                      fontSize: 14,
                      color: Color.fromARGB(255, 190, 190, 190)),
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
