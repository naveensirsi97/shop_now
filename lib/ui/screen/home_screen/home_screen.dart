import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/list.dart';
import 'package:shop_now/constant/string_const.dart';
import 'package:shop_now/controller/home_controller.dart';
import 'package:shop_now/controller/product_controller.dart';
import 'package:shop_now/services/firestore_services.dart';
import 'package:shop_now/ui/screen/category_screen/item_details.dart';
import 'package:shop_now/ui/screen/home_screen/search_screen.dart';
import 'package:shop_now/widget/featured_categoryButton.dart';
import 'package:shop_now/widget/home_button.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Get.put(
        ProductController()); // it is used for featured categories product open

    return Container(
      padding: const EdgeInsets.all(4.0),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: controller.searchController,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: searchAnythings,
                  suffixIcon: const Icon(Icons.search).onTap(() {
                    if (controller.searchController.text.isNotEmptyAndNotNull) {
                      Get.to(() => SearchScreen(
                            title: controller.searchController.text,
                          ));
                    }
                  }),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white60),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    5.heightBox,
                    VxSwiper.builder(
                      //  aspectRatio: 16/9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(slidersList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                                onPressed: () {},
                                title: index == 0 ? todayDeal : flashSale,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width / 2.5,
                                icon: index == 0
                                    ? Image.asset(
                                        'assets/images/todayDeal.jpg',
                                        width: 26,
                                      )
                                    : Image.asset(
                                        'assets/images/flashSale.png',
                                        width: 36,
                                      ),
                              )),
                    ),
                    5.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      //  autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(slidersList[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButton(
                                onPressed: () {},
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width / 3.5,
                                title: index == 0
                                    ? topCategories
                                    : index == 1
                                        ? brand
                                        : bestSellers,
                                icon: index == 0
                                    ? Image.asset(
                                        'assets/images/topCategories.png',
                                        width: 36,
                                      )
                                    : index == 1
                                        ? Image.asset(
                                            'assets/images/brand.png',
                                            width: 36,
                                          )
                                        : Image.asset(
                                            'assets/images/bestSeller.jpg',
                                            width: 36,
                                          ),
                              )),
                    ),
                    10.heightBox,

                    //Featured Category

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        featuredCategories,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                3,
                                (index) => featuredCategoryButton(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width /
                                          2.0,
                                      title: index == 0
                                          ? womenClothing
                                          : index == 1
                                              ? girlsWatches
                                              : tShirts,
                                      icon: index == 0
                                          ? Image.asset(
                                              'assets/images/girlsDress.jpg',
                                              width: 50,
                                            )
                                          : index == 1
                                              ? Image.asset(
                                                  'assets/images/girlsWatch.png',
                                                  width: 50,
                                                )
                                              : Image.asset(
                                                  'assets/images/tShirt.jpg',
                                                  width: 50,
                                                ),
                                    )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                3,
                                (index) => featuredCategoryButton(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width /
                                          2.0,
                                      title: index == 0
                                          ? mobilePhone
                                          : index == 1
                                              ? girlsDress
                                              : boysGlasses,
                                      icon: index == 0
                                          ? Image.asset(
                                              'assets/images/mobile.jpg',
                                              width: 50,
                                            )
                                          : index == 1
                                              ? Image.asset(
                                                  'assets/images/womenCloth.jpg',
                                                  width: 50,
                                                )
                                              : Image.asset(
                                                  'assets/images/boysGlasses.jpg',
                                                  width: 50,
                                                ),
                                    )),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    // Featured Product

                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            featuredProduct,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FutureBuilder(
                                future: FirestoreServices.getFeaturedProducts(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(redColor),
                                      ),
                                    );
                                  } else if (snapshot.data!.docs.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        ' No Featured Product',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  } else {
                                    var featuredData = snapshot.data!.docs;
                                    return Row(
                                      children: List.generate(
                                        featuredData.length,
                                        (index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                featuredData[index]['p_imgs']
                                                    [0],
                                                height: 150,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
                                              Text(
                                                '${featuredData[index]['p_name']}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              10.heightBox,
                                              Text(
                                                "${featuredData[index]['p_price']}"
                                                    .numCurrency,
                                                style: const TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ).onTap(() {
                                          Get.to(() => ItemDetails(
                                                title:
                                                    '${featuredData[index]['p_name']}',
                                                data: featuredData[index],
                                              ));
                                        }),
                                      ),
                                    );
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                    20.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'All Product',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        10.heightBox,
                        StreamBuilder(
                            stream: FirestoreServices.allProducts(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(redColor),
                                  ),
                                );
                              } else {
                                var allProductData = snapshot.data!.docs;
                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allProductData.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          mainAxisExtent: 300),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => ItemDetails(
                                              title:
                                                  '${allProductData[index]['p_name']}',
                                              data: allProductData[index],
                                            ));
                                      },
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              allProductData[index]['p_imgs']
                                                  [0],
                                              height: 200,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${allProductData[index]['p_name']}',
                                              style: const TextStyle(
                                                  color: Colors.redAccent,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            5.heightBox,
                                            Text(
                                              '${allProductData[index]['p_price']}',
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            5.heightBox,
                                            const Text(
                                              'Limited Stock Hurry Up! ',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            10.heightBox,
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            })
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
