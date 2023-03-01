// import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_navigation/library.dart';
// import 'package:makeframes/screens/stageShow/provider/map_provider.dart';
// import 'package:provider/provider.dart';


// class BookstageShowScreen extends StatelessWidget {
//   const BookstageShowScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<MapProvider>(context,listen: false).getcurrentlocation();
//     return Scaffold(
//       body:Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Consumer<MapProvider>(
//           builder: (context, value, child) {
//             return  Container(
//             child:MapBoxNavigationView(
//               options: MapBoxOptions(
//                 initialLatitude: value.currentlatlng.latitude,
//                 initialLongitude: value.currentlatlng.longitude,
//                 zoom: 15   
//               ),
//             ) ,
//           );
//           },
          
//         ),
//       )  ,
//     );
//   }
// }