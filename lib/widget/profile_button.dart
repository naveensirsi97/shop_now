import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget profileButton({icon, String? title, onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        5.widthBox,
        Text(
          title!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  );
}
