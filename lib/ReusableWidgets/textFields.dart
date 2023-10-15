import 'package:flutter/material.dart';

Widget buildTextField(
bool isPasswordVisible,
  String label,
  TextEditingController textController,
  Icon prefixIcon,
  IconButton suffixIcon,
  TextInputType textInputType,
  bool isPasswordTextField,
    String? Function(String? value) validate,
) {
  return TextFormField(
    obscureText: isPasswordVisible,
    enabled: true,
    decoration: InputDecoration(
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: label,
      hintStyle: TextStyle(
        fontSize: 15,
        color: Colors.black.withOpacity(0.5),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    ),
    style: const TextStyle(
      color: Colors.black,
      height: 1,
    ),
    autofocus: false,
    controller: textController,
    keyboardType: textInputType,
    textInputAction:
        isPasswordTextField ? TextInputAction.done : TextInputAction.next,
    validator: validate,
  );
}

/*Widget buildTextField2(
  String label,
  TextEditingController textController,
  TextInputType textInputType,
  bool isReadOnly,
) {
  return TextFormField(
    obscureText: false,
    enabled: true,
    decoration: InputDecoration(
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: label,
      hintStyle: TextStyle(
        fontSize: 15,
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    style: const TextStyle(
      color: Colors.black,
      height: 1,
    ),
    autofocus: false,
    controller: textController,
    keyboardType: textInputType,
    readOnly: isReadOnly,
  );
  validator: (value) {

  },
}*/
