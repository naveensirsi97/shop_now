import 'package:flutter/material.dart';

Widget button({String? title, onPressed,color,textColor}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(title!,style: TextStyle(color: textColor),));
}
