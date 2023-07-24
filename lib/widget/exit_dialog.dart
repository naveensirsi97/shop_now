import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/widget/button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Confirm',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey),
          ),
          10.heightBox,
          const Text(
            'Are you sure you want to exit?',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.blueGrey),
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                  color: redColor,
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  title: 'Yes',
                  textColor: Colors.white),
              button(
                  color: redColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'No',
                  textColor: Colors.white),
            ],
          )
        ],
      ),
    ),
  );
}
