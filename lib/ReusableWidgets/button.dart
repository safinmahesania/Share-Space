import 'package:flutter/material.dart';

Widget buildButton(
    String buttonText, BuildContext context, Function() onPressed) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.teal.shade200;
        }
        return Colors.teal;
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    child: Text(
      buttonText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

Widget buildORRow(Color color) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: color,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'OR',
          style: TextStyle(
            color: color,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: color,
          thickness: 1,
        ),
      ),
    ],
  );
}
