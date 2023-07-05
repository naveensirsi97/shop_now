import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/ui/screen/category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

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
                height: 350,
                color: redColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.heightBox,
                      AppBar(
                        forceMaterialTransparency: true,
                        title: Text(
                          title!,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              5,
                              (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: const Center(
                                        child: Text(
                                      'Baby Cloth',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      150.heightBox,
                      Container(
                        color: Colors.white,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 9,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 250,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => const ItemDetails(
                                      title: "Product Details"));
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                            }),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
