import 'package:emart_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget profileButton({icon,width,height,String? title,onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color:redColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          5.widthBox,
          Text(title!,style: const TextStyle(color: Colors.white,fontSize: 16),),
        ],
      ),
    ),
  );
}
