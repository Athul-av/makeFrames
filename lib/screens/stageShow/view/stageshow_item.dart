import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';
import 'package:makeframes/screens/stageShow/view/bookshow_screen.dart';
import 'package:makeframes/screens/stageShow/view/stageshow_details.dart';

class Showcontainer extends StatelessWidget {
  Showcontainer({super.key, required this.value});

  AllStageShowRes value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => StageShowDetails(value: value)));
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 34, 34, 34),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    width: width(context, 0.27),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(value.imageArray![0])),
                    ),
                  ),
                ),
                SizedBox(
                  width: width(context, 0.35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      normaltext(value.category!,
                          const Color.fromARGB(255, 184, 184, 184), 10)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(color1()),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            BookstageShowScreen(progrmid: value.id)));
                  },
                  child: normaltext('Book Now',
                      const Color.fromARGB(255, 231, 231, 231), 11)),
            )
          ],
        ),
      ),
    );
  }
}
