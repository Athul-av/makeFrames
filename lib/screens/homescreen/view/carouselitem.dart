import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/view/all_stageshow_list.dart';

Widget caroselitems(String image, context) {
  return Stack(children: [
    Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Positioned(
        bottom: 45,
        right: 35,
        child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color1()),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
                onPressed: () {},
                child:  Padding(
                  padding:const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: boldtext('Approach Producer',const Color.fromARGB(255, 231, 231, 231), 15) 
                ))))
  ]);
}

Widget caroselitems2(String image, context) {
  return Stack(children: [
    Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Positioned(
        bottom: 45,
        right: 35,
        child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color1()),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StageshowList()));
                },
                child:  Padding(
                  padding:const EdgeInsets.only(top: 10.0, bottom: 10),
                  child:boldtext('Book stage show',const Color.fromARGB(255, 231, 231, 231), 15) 
                 
                ))))
  ]);
}
