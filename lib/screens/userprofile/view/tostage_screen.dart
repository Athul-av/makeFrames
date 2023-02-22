import 'package:flutter/material.dart';
import 'package:makeframes/Services/ArtistcreatedshowsService/createdshow_servc.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/splash/provider/splashpro.dart';
import 'package:makeframes/screens/userprofile/model/createdshow_res.dart';
import 'package:makeframes/screens/userprofile/view/createshow_form.dart';
import 'package:provider/provider.dart';

class ToStageScreen extends StatelessWidget {
  const ToStageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String token = Provider.of<SplashProvider>(context,listen: false).logincheck!;
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
          'Your Stage shows',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: color1(),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateShowScreen()));
          },
          label: const Text('New show')),
      body:FutureBuilder<List<ArtistCreatedShowRes>?>( 
        future:CreatedShowService().artiststagePrograms(token),  
        builder: (context, snapshot) {
          if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
          return ListView.builder (itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: height(context, 0.23),
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 23, 23, 23), 
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,11,10,11), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,   
                            children: [
                              Text(snapshot.data![index].name!,style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              
                              Text(snapshot.data![index].category!,style:const TextStyle(color: Color.fromARGB(255, 108, 108, 108),fontSize: 12,),)
                            ],
                          ), 
                          SizedBox(
                            height: height(context, 0.04),
                            width: width(context, 0.24),
                            child: ElevatedButton(
                              
                              style: ElevatedButton.styleFrom(
                                backgroundColor:const Color.fromARGB(255, 144, 37, 30),
                            shape:const  RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                                 bottomLeft: Radius.circular(10.0),
                                   ),
                                  ),   
                                ),
                               child: Text('${snapshot.data![index].bookingCount} Booking',style:const TextStyle(fontSize: 11),),
                              onPressed: (){},), 
                          )
                        ],  
                      ),
                      hsizedbox(context, 0.019),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                         crossAxisAlignment: CrossAxisAlignment.center, 
                        children: [
                        SizedBox(
                          height: height(context, 0.10 ),
                          width: width(context, 0.6),
                       
                          child: Center(child: Text(snapshot.data![index].description!,style:const TextStyle(color: Color.fromARGB(255, 211, 211, 211) ,fontSize: 13),))),
                          SizedBox(
                            height: height(context, 0.10),
                          width: width(context, 0.24),
                          
                          child: const Image( 
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/drama.jpg')),
                          ) 
                      ],),
                      const SizedBox(height: 4 ,),
                      Text("Amount : ${snapshot.data![index].amount}",style: TextStyle(color: color1(),fontWeight: FontWeight.bold),) 
                ]), 
              ),  
            ),
          );
        },
        itemCount: snapshot.data!.length,
        );
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,),); 
        }
        else{
           return const Center(child: Text('no stage show created!',style: TextStyle(color: Colors.white), ),); 
        }  
        },
      )
    );
  }
}
   