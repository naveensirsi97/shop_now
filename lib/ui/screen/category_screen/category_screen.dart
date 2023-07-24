import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/list.dart';
import 'package:shop_now/constant/string_const.dart';
import 'package:shop_now/controller/product_controller.dart';
import 'package:shop_now/ui/screen/category_screen/category_details.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: redColor,
        //  forceMaterialTransparency: true,
        title: const Text(
          category,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  10.heightBox,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  //  crossAxisSpacing: 4,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getSubCategories(categoryList[index]);
                    Get.to(() => CategoryDetails(
                          title: categoryList[index],
                        ));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          categoryImageList[index],
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                        // const Spacer(),
                        16.heightBox,
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
    );
  }
}
