import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget profileCard({width, String? title, String? count, onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count!,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            5.widthBox,
            Text(
              title!,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
