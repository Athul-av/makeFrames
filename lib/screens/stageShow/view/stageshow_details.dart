

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';
import 'package:makeframes/screens/stageShow/provider/allstageshow_provider.dart';
import 'package:provider/provider.dart';

class StageShowDetails extends StatelessWidget {
   StageShowDetails({super.key,required this.value});
AllStageShowRes value;
  @override
  Widget build(BuildContext context) {
    final providerstage = Provider.of<AllStageShowProvider>(context,listen: false);
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
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            
            children: [
           Align(
          
            child:  Text(value.name!,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          const Align(
             child:  Padding(
                padding:  EdgeInsets.all(5.0),
                child: Text('hello',style: TextStyle(color: Color.fromARGB(255, 168, 168, 168),fontSize: 12),),
              ),
           ),
            hsizedbox(context, 0.03),
            Row(
              children: [
                FutureBuilder<Uint8List?>( 
                  future:providerstage.getThumbnail(value.vdoFile!),
                  builder: (context, snapshot) {
                    if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){  
                   return  Stack(
                    alignment: Alignment.center, 
                     children:[ SizedBox(
                                     height: height(context, 0.26),
                                     width: width(context, 0.46),
                     child: Image.memory(
                      
                       snapshot.data!,fit: BoxFit.cover), 
                                     ),
                            const Icon(Icons.play_circle_outline_outlined ,color: Color.fromARGB(255, 169, 169, 169),size: 4,)
                                     ]
                   );
                    }else{
                       return  SizedBox(
                  height: height(context, 0.26),
                  width: width(context, 0.46),
                   child:const Center(child: Icon(Icons.videocam_off_rounded,color: Color.fromARGB(255, 150, 150, 150),size: 35 ,)), 
                  );
                    }
                    
                  },
                
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height(context, 0.13), 
                      width: width(context, 0.517),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(value.imageArray![0])), 
                    ),
                    SizedBox(
                       height: height(context, 0.13),  
                      width: width(context, 0.517),
                       child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(value.imageArray![1])), 
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight, 
              child: TextButton(onPressed: (){}, child:const Text('more media',style: TextStyle(color: Color.fromARGB(255, 27, 92, 146)),))), 
            hsizedbox(context, 0.01),  
           Padding(
             padding:const EdgeInsets.all(5.0),
             child: Text(value.description!,style: const TextStyle(color: Colors.white,fontSize: 16),),
           ),
           Padding(
             padding: const EdgeInsets.only(top:16.0,left: 5),  
             child: Text('Amount : ${value.amount} ',style: TextStyle(color:color1(),fontWeight: FontWeight.bold)),
           )
            ]),
        ),
    );
  }
}