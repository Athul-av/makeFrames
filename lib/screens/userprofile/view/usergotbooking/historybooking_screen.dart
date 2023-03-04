import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/artistgotbooking_prvdr.dart';
import 'package:provider/provider.dart';

class HistoryBookingScreen extends StatelessWidget {
  const HistoryBookingScreen ({super.key});

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
          
        ),

        body: Consumer<ArtistGotBookingProvider>(
          builder: (context, value, child) {
            if(value.bookings?.his == null || value.bookings!.his!.isEmpty ){  
              return Center(child: boldtext('no history', Colors.white, 14),); 
            }else{ 
              
               return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: height(context, 0.19), 
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
                              boldtext(value.bookings!.his![index].date, Colors.white, 12)
                            ],
                          ),
                          Row(
                            children: [
                           
                              boldtext('Time of Program : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              boldtext(value.bookings!.his![index].time!, Colors.white, 12)
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
                                        value.bookings!.his![index].address!,
                                        Colors.white,
                                        12)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              boldtext('Mobile number    : ',
                                  const Color.fromARGB(255, 179, 179, 179), 12),
                              boldtext(value.bookings!.his![index].mob!, Colors.white, 12)
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
                itemCount: value.bookings!.his!.length,  
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