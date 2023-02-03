import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: Text(
            "HOME SCREEN",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
