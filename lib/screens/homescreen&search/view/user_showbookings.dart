import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/homescreen&search/provider/userbookinglist_provider.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class UserStageBookings extends StatelessWidget {
  const UserStageBookings({super.key});

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
        title: boldtext("You booked shows", Colors.white, 17),
        centerTitle: true,
      ),
      body: Consumer<UserBookingListProvider>(
        builder: (context, value, child) {
          if (value.userbookings == null || value.userbookings!.isEmpty) {
            return Center(
              child: boldtext("no bookings", Colors.white, 14),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: height(context, 0.19),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 34, 34, 34),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  boldtext(
                                      value.userbookings![index].programId!
                                          .name!,
                                      Colors.white,
                                      16),
                                  normaltext(
                                      value.userbookings![index].programId!
                                          .category!,
                                      const Color.fromARGB(255, 179, 179, 179),
                                      12),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      normaltext(
                                          'Booked date : ',
                                          const Color.fromARGB(
                                              255, 187, 187, 187),
                                          13),
                                      normaltext(
                                          value.userbookings![index].date,
                                          Colors.white,
                                          13)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Row(
                                      children: [
                                        normaltext(
                                            'Booked time :',
                                            const Color.fromARGB(
                                                255, 187, 187, 187),
                                            13),
                                        normaltext(
                                            '${value.userbookings![index].time}',
                                            Colors.white,
                                            13),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShapeOfView(
                                    height: 28,
                                    width: width(context, 0.22),
                                    shape: BubbleShape(
                                        position: BubblePosition.Left,
                                        arrowPositionPercent: 0.5,
                                        borderRadius: 5,
                                        arrowHeight: 16,
                                        arrowWidth: 13),
                                    child: Container(
                                      width: 40,
                                      color: color1(),
                                      child: Center(
                                          child: boldtext(
                                              '₹ ${value.userbookings![index].programId!.amount}',
                                              Colors.white,
                                              14)),
                                    ),
                                  ),
                                  value.userbookings![index].isAccepted == true
                                      ? Row(
                                          children: [
                                            boldtext("Accepted", color1(), 13),
                                            Icon(
                                              Icons.verified_sharp,
                                              color: color1(),
                                            )
                                          ],
                                        )
                                      : value.userbookings![index].rejected ==
                                              true
                                          ? Row(
                                              children: [
                                                boldtext(
                                                    "rejected",
                                                    const Color.fromARGB(
                                                        255, 159, 44, 36),
                                                    13),
                                                const Icon(
                                                  Icons.cancel,
                                                  color: Color.fromARGB(
                                                      255, 157, 42, 34),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                boldtext(
                                                    "Pending",
                                                    const Color.fromARGB(
                                                        255, 157, 42, 34),
                                                    13),
                                                const Icon(
                                                  Icons.hourglass_top_rounded,
                                                  color: Color.fromARGB(
                                                      255, 157, 42, 34),
                                                )
                                              ],
                                            )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      hsizedbox(context, 0.01)
                    ],
                  );
                },
                itemCount: value.userbookings!.length,
              ),
            );
          }
        },
      ),
    );
  }
}
