import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double width(context, double size) {
  return MediaQuery.of(context).size.width * size;
}

double height(context, double size) {
  return MediaQuery.of(context).size.height * size;
} 

Color color1() {
  return const Color.fromARGB(255, 42, 81, 68);
}
