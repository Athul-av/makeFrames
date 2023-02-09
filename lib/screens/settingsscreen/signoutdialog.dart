import 'package:flutter/material.dart';

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
      content: message == null
          ? null
          : Text(
              message!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 83, 83, 83), fontSize: 13),
            ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
