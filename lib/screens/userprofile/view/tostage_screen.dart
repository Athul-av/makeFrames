import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/view/createshow_form.dart';

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
          label: const Text('New show ')),
      body: const Center(
          child: Text(
        "No stageshows created!",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
