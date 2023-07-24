import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/ui/screen/category_screen/category_details.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featuredCategoryButton({icon, width, height, String? title}) {
  return InkWell(
    onTap: () {
      Get.to(() => CategoryDetails(title: title));
    },
    child: Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white30, borderRadius: BorderRadius.circular(16)),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            5.widthBox,
            Text(title!),
          ],
        ),
      ),
    ),
  );
}
