
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:provider/provider.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Provider.of<DpGetProvider>(context,listen: false).chatlist();  
    
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

      body: Consumer<DpGetProvider>(
        builder: (context, value, child) {
          
          if(value.messagepeopledetais.isEmpty){
            return Center(child: boldtext("no chats", Colors.white, 15));
          }else{
            return ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Card(
                  color: const Color.fromARGB(255, 25, 25, 25),  
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: ListTile(
                      leading: 
                      value.messagepeopledetais[index].dpimage == null?
                     const CircleAvatar(
                        radius: 30,
                      ):  CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(value.messagepeopledetais[index].dpimage), 
                      ), 
                      title: boldtext(value.messagepeopledetais[index].firstName!, Colors.white, 17),
                      trailing: Icon(Icons.message, color: Colors.white,),
                    ), 
                  ),
                ),
              );
            },
            itemCount: value.messagepeopledetais.length,  
          
            );
          }
        },
      ),
    );
  }
}