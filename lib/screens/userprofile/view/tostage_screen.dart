import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/artistcreated_shows_prvdr.dart';
import 'package:makeframes/screens/userprofile/provider/artistgotbooking_prvdr.dart';
import 'package:makeframes/screens/userprofile/view/usergotbooking/artistgotbooking_screen.dart';
import 'package:makeframes/screens/userprofile/view/createshow_form.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class ToStageScreen extends StatelessWidget {
  const ToStageScreen({super.key});

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
        body: Consumer<ArtistCreatedShowsProvider>(
          builder: (context, value, child) {
            if (value.data == null || value.data!.isEmpty) {
            
              return Center(
                child: boldtext('no stage show created!', Colors.white, 13),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: height(context, 0.216),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 23, 23, 23),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 13, 10, 11),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      boldtext(value.data![index].name!,
                                          Colors.white, 20),
                                      normaltext(
                                          value.data![index].category!,
                                          const Color.fromARGB(
                                              255, 108, 108, 108),
                                          12)
                                    ],
                                  ),
                                  SizedBox(
                                    height: height(context, 0.035),
                                    width: width(context, 0.28),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 144, 37, 30),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      child: normaltext(
                                          'Check Bookings',
                                          Colors.white,
                                          10),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ArtistGotBookingScreen(
                                                      prgrmid:
                                                          value.data![index].id,
                                                    ))); 
                                        Provider.of<ArtistGotBookingProvider>(
                                                context,
                                                listen: false) 
                                            .getartistbookings(
                                                value.data![index].id!); 
                                      },
                                    ),
                                  )
                                ],
                              ),
                              hsizedbox(context, 0.019),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: height(context, 0.082),
                                      width: width(context, 0.6),
                                      child: Center(
                                        child: normaltext(
                                            value.data![index].description!,
                                            const Color.fromARGB(
                                                255, 211, 211, 211),
                                            13),
                                      )),
                                  SizedBox(
                                    height: height(context, 0.082),
                                    width: width(context, 0.27),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            value.data![index].imageArray![0])),
                                  ) 
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              ShapeOfView(
                                height: 24,
                                width: width(context, 0.22),
                                shape: BubbleShape(
                                    position: BubblePosition.Left,
                                    arrowPositionPercent: 0.5,
                                    borderRadius: 5,
                                    arrowHeight: 16,
                                    arrowWidth: 12),
                                child: Container(
                                  width: 40,
                                  color: color1(),
                                  child: Center(
                                    child: boldtext(
                                        '₹ ${value.data![index].amount}',
                                        Colors.white,
                                        14),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                },
                itemCount: value.data!.length,
              );
            }
          },
        ));
  }
}
