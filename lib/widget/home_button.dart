import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({icon,width,height,String? title,onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Card(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color:Colors.white30,borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            10.heightBox,
             Text(title!),
          ],
        ),
      ),
    ),
  );
}
