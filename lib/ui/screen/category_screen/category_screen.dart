import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/ui/screen/category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: redColor,
                child: AppBar(
                  forceMaterialTransparency: true,
                  title: const Text(
                    category,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 10,
            right: 10,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    50.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 200),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => CategoryDetails(
                                  title: categoryList[index],
                                ));
                          },
                          child: Container(
                            // padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              //   borderRadius: BorderRadius.circular(8),
                              //  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  categoryImageList[index],
                                  height: 160,
                                  width: 200,
                                  fit: BoxFit.fill,
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    categoryList[index],
                                    style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
