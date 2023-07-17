import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/message/message_screen.dart';
import 'package:makeframes/screens/userprofile/provider/dpget_provider.dart';
import 'package:provider/provider.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

      body: Consumer<DpGetProvider>( 
        builder: (context, value, child) {
           
          if(value.messagepeopledetais.isEmpty){
            return Center(child: boldtext("No chats", Colors.white, 15));
          }else{
            return ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Card(
                  color: const Color.fromARGB(255, 25, 25, 25),  
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: InkWell(
                      onTap: () { 
                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                          MessageScreen(artistid: value.messagepeopledetais[index].id,dpimage: value.messagepeopledetais[index].dpimage,userid: userid,)));
                      },
                      child: ListTile(
                        leading: 
                        value.messagepeopledetais[index].dpimage == null?
                       const CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 25, 25, 25),
                          foregroundColor: Color.fromARGB( 255, 130, 130, 130),
                          child: Icon( CupertinoIcons .person_alt_circle_fill,size: 65,), 
                        ):  CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(value.messagepeopledetais[index].dpimage), 
                        ), 
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldtext(value.messagepeopledetais[index].firstName!, Colors.white, 18),
                            normaltext(value.messagepeopledetais[index].domain!,const Color.fromARGB(255, 151, 151, 151), 9)
                          ],
                        ),
                        trailing:const Icon(Icons.message, color: Colors.white,),
                      ),
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