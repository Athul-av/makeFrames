import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';
import 'package:makeframes/screens/stageShow/provider/allstageshow_provider.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:video_player/video_player.dart';

class StageShowDetails extends StatelessWidget {
  StageShowDetails({super.key, required this.value});
  AllStageShowRes value;
  

   @override
  Widget build(BuildContext context) {
    Provider.of<AllStageShowProvider>(context,listen: false).videoplayerinitialize(value.vdoFile!); 
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Provider.of<AllStageShowProvider>(context,listen: false).contrlr.pause(); 
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
       body: ListView( 
        children: [
          hsizedbox(context, 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Align(child: boldtext(value.name!,Colors.white, 22)), 
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Align(child: normaltext(value.category!,const Color.fromARGB(255, 174, 174, 174), 12)),
          ),
          hsizedbox(context, 0.032),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: normaltext(value.description!,const Color.fromARGB(255, 214, 214, 214), 15),
          ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0,30,20,20), 
             child: Align(
              alignment: Alignment.centerRight,
              
               child: ShapeOfView(
                       height: 28,
                       width: width(context, 0.24),
                       shape: BubbleShape(
                         position: BubblePosition.Left,
                         arrowPositionPercent: 0.5,
                         borderRadius: 5,
                         arrowHeight: 16,
                         arrowWidth: 13 
                       ),
                       child: Container(
                         width: 40, 
                         color:color1(), 
                         child: Center(child: 
                       
                        boldtext('₹ ${value.amount}', Colors.white, 14)
                         ), 
                       ),
                     ),
             ),
           ), 
         ListView.builder(
          shrinkWrap: true,
          physics:const ScrollPhysics() , 
           itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.only(top:10.0),
             child: Image(
              fit: BoxFit.fill, 
              image:NetworkImage(value.imageArray![index])),
           );
         },
         itemCount: value.imageArray!.length,), 
          Consumer<AllStageShowProvider>(
            builder: (context, value, child) { 
              return  SizedBox(
              height: 350, 
              width: MediaQuery.of(context).size.width, 
              child:Stack(
              alignment: Alignment.center,
                children:[ VideoPlayer(value.contrlr),
              IconButton(onPressed: (){
               value.playvdo();
              }, icon: 
              value.isplay?
             const Icon(Icons.pause_circle_filled,size: 45,color: Colors.white,):
              const Icon(Icons.play_circle_fill,size: 45,color: Colors.white,)) 
              ]) , 
            );
            },
            
          )
        ],
       ),
     );
   }
}







