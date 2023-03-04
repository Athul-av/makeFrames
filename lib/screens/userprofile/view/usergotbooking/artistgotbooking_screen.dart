import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/artistgotbooking_prvdr.dart';
import 'package:makeframes/screens/userprofile/view/usergotbooking/acceptedbooking_screen.dart';
import 'package:makeframes/screens/userprofile/view/usergotbooking/pendingbookings_screen.dart';
import 'package:makeframes/screens/userprofile/view/usergotbooking/historybooking_screen.dart';
import 'package:provider/provider.dart';

class ArtistGotBookingScreen extends StatelessWidget {
  ArtistGotBookingScreen({super.key, required this.prgrmid});

  String? prgrmid;
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
          return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PendingBookingScreen(
                                    id: prgrmid,
                                  )));
                        },
                        child: boldtext('Pending Bookings', Colors.white, 16)),
                     CircleAvatar(
                      radius: 11,
                      backgroundColor:const Color.fromARGB(255, 21, 97, 159),
                      foregroundColor: Colors.white,
                      child: Center(child: 
                      value.bookings?.pend == null?
                     const Text('0'):
                      Text(value.bookings!.pend!.length.toString()) 

                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const AcceptedBookingScreen()));
                        },
                        child: boldtext('Accepted Bookings', Colors.white, 16)),
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: color1(),
                      foregroundColor: Colors.white,
                      child: 
                      value.bookings?.acc == null?
                     const Text('0'):
                      Text(value.bookings!.acc!.length.toString())  
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const HistoryBookingScreen()));
                        },
                        child: boldtext('Booking History', Colors.white, 16)),
                     CircleAvatar(
                      radius: 11,
                      backgroundColor:const Color.fromARGB(255, 159, 21, 21),
                      foregroundColor: Colors.white,
                      child: 
                      value.bookings?.his == null?
                     const Text('0'):
                      Text(value.bookings!.his!.length.toString()) 
                    )
                  ],
                )
              ],
            ),
          ),
        ); 
        },
      
      ),
    );
  }
}
