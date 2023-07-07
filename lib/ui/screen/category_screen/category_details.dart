import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/ui/screen/category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: redColor,
        // forceMaterialTransparency: true,
        title: Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: redColor,
            child: Expanded(
              child: SingleChildScrollView(
                //      physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      controller.subcat.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                                child: Text(
                              '${controller.subcat[index]}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                          )),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => const ItemDetails(title: "Product Details"));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            categoryImageList[index],
                            height: 200,
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
