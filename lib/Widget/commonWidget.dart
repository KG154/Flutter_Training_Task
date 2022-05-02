import 'dart:ui';

import 'package:flutter/material.dart';

Widget commonContainer({
  double? height,
  double? width,
  required String title,
  double? textSize,
}) {
  return Container(
    height: height ?? 75,
    width: width,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.elliptical(70, 70),
        bottomLeft: Radius.elliptical(70, 70),
      ),
      border: Border.all(width: 1.0, color: Colors.blue),
      boxShadow: [
        BoxShadow(
            color: Colors.black87.withOpacity(0.3),
            blurRadius: 1,
            offset: Offset(0, 1),
            spreadRadius: 1)
      ],
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(fontSize: textSize ?? 20, color: Colors.white),
      ),
    ),
  );
}

Widget commonButton({
  double? height,
  double? width,
  double? textSize,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  required String title,
}) {
  return Container(
    padding: padding,
    margin: margin,
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),
        boxShadow: [
          BoxShadow(
              color: Colors.black87.withOpacity(0.3),
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 1)
        ],
        border: Border.all(color: Colors.blue)),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          letterSpacing: 2, color: Colors.white, fontSize: textSize ?? 20),
    ),
  );
}

Widget commonTextField({
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool obscureText = false,
  Function? onchange,
  Color? color,
  String? labelText,
  String? hintText,
  IconData? prefixIcon,
  IconButton? suffixIcon,
  String? errorText,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType ?? TextInputType.text,
    obscureText: obscureText,
    onChanged: (value) {
      onchange!(value);
    },
    style: TextStyle(color: color ?? Colors.white),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(color: color ?? Colors.white),
      hintStyle: TextStyle(color: color ?? Colors.white),
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.white,
        size: 30,
      ),
      suffixIcon: suffixIcon,
      errorText: errorText,
    ),
  );
}
