import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/all_stageshow_list.dart';

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
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text(
                    'Approach producer',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 231, 231, 231),
                        fontWeight: FontWeight.bold),
                  ),
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
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text(
                    'Book stage show',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 231, 231, 231),
                        fontWeight: FontWeight.bold),
                  ),
                ))))
  ]);
}
