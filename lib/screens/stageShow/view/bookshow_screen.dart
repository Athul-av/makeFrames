import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/keys.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/core/stage_textfield.dart';
import 'package:makeframes/screens/stageShow/provider/bookstage_provider.dart';
import 'package:provider/provider.dart';

class BookstageShowScreen extends StatelessWidget {
  BookstageShowScreen({super.key, required this.progrmid});

  String? progrmid;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<BookStageProvider>(context, listen: false)
            .getcurrentlocation(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Provider.of<BookStageProvider>(context, listen: false)
                  .disposeallfield();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Consumer<BookStageProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      boldtext('Book Stage show!', Colors.white, 18),
                      hsizedbox(context, 0.007),
                      normaltext('please fill the form to book the stage show ',
                          const Color.fromARGB(255, 113, 113, 113), 12),
                    ],
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: Form(
                      key: formkey,
                      child: ListView(
                        children: [
                          CreateStageTextField(
                            keyboardtype: TextInputType.name,
                            contentpadding: 18,
                            controller: value.addresscontroller,
                            cursorcolor: color1(),
                            label: "Address of the Stage",
                            maxlines: 3,
                            validatormessage: "fill this field",
                          ),
                          hsizedbox(context, 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height(context, 0.06),
                                width: width(context, 0.62),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: value.pickeddate == null
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: normaltext(
                                              'selected date',
                                              const Color.fromARGB(
                                                  255, 178, 178, 178),
                                              12),
                                        ))
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: normaltext(value.spliteddate!,
                                              Colors.white, 12),
                                        )),
                              ),
                              Container(
                                height: height(context, 0.06),
                                width: width(context, 0.17),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: Color.fromARGB(255, 213, 213, 213),
                                  ),
                                  onPressed: () {
                                    value.selectDate(context);
                                  },
                                ),
                              )
                            ],
                          ),
                          hsizedbox(context, 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height(context, 0.06),
                                width: width(context, 0.62),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: value.picktime == null
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: normaltext(
                                              'selected time',
                                              const Color.fromARGB(
                                                  255, 178, 178, 178),
                                              12),
                                        ))
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: normaltext(
                                              value.picktime.toString(),
                                              Colors.white,
                                              12),
                                        )),
                              ),
                              Container(
                                height: height(context, 0.06),
                                width: width(context, 0.17),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.access_time_filled,
                                    color: Color.fromARGB(255, 213, 213, 213),
                                  ),
                                  onPressed: () {
                                    value.selectTime(context);
                                  },
                                ),
                              )
                            ],
                          ),
                          hsizedbox(context, 0.015),
                          CreateStageTextField(
                            keyboardtype: TextInputType.number,
                            contentpadding: 18,
                            controller: value.numbercontroller,
                            cursorcolor: color1(),
                            label: "Mobile number",
                            maxlines: 1,
                            validatormessage: "enter your mobile number",
                          ),
                          hsizedbox(context, 0.012),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              height: height(context, 0.23),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 38, 38, 38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: FlutterMap(
                                mapController: value.contrler,
                                options: MapOptions(
                                  minZoom: 4,
                                  maxZoom: 15,
                                  zoom: 8,
                                  center: value.currentlatlng,
                                  onTap: (tapPosition, point) {
                                    value.ontapmap(point);
                                  },
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
                                      Marker(
                                          point: value.currentlatlng,
                                          builder: (context) => const Icon(
                                                Icons.location_on,
                                                color: Color.fromARGB(
                                                    255, 203, 52, 41),
                                              ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, top: 2, bottom: 5),
                            child: normaltext("pick the stage location",
                                const Color.fromARGB(255, 169, 169, 169), 9),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate() &&
                                    value.pickeddate != null &&
                                    value.picktime != null &&
                                    progrmid != null) {
                                  value.bookstageshow(progrmid, context);
                                } else if (value.pickeddate == null) {
                                  CustomSnackBar().snackBar(
                                      context,
                                      'pick a date',
                                      const Color.fromARGB(255, 138, 36, 29));
                                } else if (value.picktime == null) {
                                  CustomSnackBar().snackBar(
                                      context,
                                      'pick a time',
                                      const Color.fromARGB(255, 138, 36, 29));
                                } else {
                                  CustomSnackBar().snackBar(
                                      context,
                                      "couldn't book",
                                      const Color.fromARGB(255, 138, 36, 29));
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(color1()),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: value.isload
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : const Text('Submit')),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
