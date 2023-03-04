import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/keys.dart';
import 'package:makeframes/screens/userprofile/provider/artistgotbooking_prvdr.dart';
import 'package:provider/provider.dart';

class AcceptedBookingScreen extends StatelessWidget {
  const AcceptedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ArtistGotBookingProvider>(context,listen: false).currentloc(context); 
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
      body: Consumer<ArtistGotBookingProvider>(
          builder: (context, value, child) {
            if(value.bookings?.acc == null || value.bookings!.acc!.isEmpty ){ 
              return Center(child: boldtext('no accepted', Colors.white, 14),); 
            }else{
              
               return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: height(context, 0.37), 
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 23, 23, 23),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              boldtext('Date of Program  : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              boldtext(value.bookings!.acc![index].date, Colors.white, 12)
                            ],
                          ),
                          Row(
                            children: [
                           
                              boldtext('Time of Program : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              boldtext(value.bookings!.acc![index].time!, Colors.white, 12)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldtext('Adress of stage   : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              SizedBox(
                                height: 43,
                                width: width(context, 0.5),
                                child: SingleChildScrollView(
                                    child: boldtext( 
                                        value.bookings!.acc![index].address!, 
                                        Colors.white,
                                        12)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              boldtext('Mobile number    : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              boldtext(value.bookings!.acc![index].mob!, Colors.white, 12)
                            ],
                          ),
                          SizedBox(
                            height: height(context, 0.18),
                            width: MediaQuery.of(context).size.width,
                            child: FlutterMap(
                              mapController: value.controlr,
                              options: MapOptions(
                                minZoom: 4,
                                maxZoom: 15,
                                zoom: 9,
                                center:value.curntloc, 
                               
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=${Mapaccesstoken.maptoken}',
                                  additionalOptions: const { 
                                    'accessToken': Mapaccesstoken.maptoken,
                                    'id': 'mapbox/streets-v12',
                                  },
                                ),
                                MarkerLayer( 
                                  markers: [
                                    Marker(point: value.curntloc,  
                                    builder: (context) => const Icon(
                                              Icons.my_location, 
                                              color: Color.fromARGB(255, 69, 87, 224),size: 11,
                                            ) ), 
                                    Marker(
                                        point:LatLng(value.bookings!.acc![index].mark!.latitude!,value.bookings!.acc![index].mark!.longitude!),
                                        builder: (context) => const Icon(
                                              Icons.location_on,
                                              color: Color.fromARGB(
                                                  255, 203, 52, 41),size: 11,
                                            ))
                                  ],
                                ),
                                PolylineLayer(
                         polylines: [
                                Polyline(
                                  isDotted: true, 
                                points: [
                               value.curntloc,
                              LatLng(value.bookings!.acc![index].mark!.latitude!,value.bookings!.acc![index].mark!.longitude!), 
                         ],
                              color: Colors.blue,
                              strokeWidth: 2.0,
                            ),
                             ],
                       ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ), 
                  );
                },
                itemCount: value.bookings!.acc!.length, 
                // value.bookings!.acc!.length, 
                separatorBuilder: (context, index) {
                  return hsizedbox(context, 0.02);  
                },
              ),
            ); 
            }
           
          },
        )
        );
    
  }
}
