import 'package:flutter/material.dart';

Widget buildIconsRow(
  Size size,
  Function() onGooglePressed,
) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white), // Button background color
      foregroundColor: MaterialStateProperty.all(Colors.teal), // Text color
      elevation: MaterialStateProperty.all(5), // Elevation (shadow)
    ),
    onPressed: onGooglePressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/google.png',
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        const Text(
          'Sign in with Google',
          style: TextStyle(
            fontSize: 16,
            color: Colors.teal,
          ),
        ),
      ],
    ),
  ); /*InkWell(
    onTap: onGooglePressed,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google.png',
            width: 45,
            height: 45,
          ),
          SizedBox(
            width: size.width*0.01,
          ),
          Text(
            'Sign in with Google',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );*/
}
