import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/widget/featured_categoryButton.dart';
import 'package:emart_app/widget/home_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  hintText: searchAnythings,
                  suffixIcon: const Icon(Icons.search),
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
                                      onPressed: () {},
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
                                      onPressed: () {},
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
                            child: Row(
                              children: List.generate(
                                6,
                                (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/mobile.jpg',
                                        width: 150,
                                        fit: BoxFit.fill,
                                      ),
                                      10.heightBox,
                                      const Text(
                                        'Mobile 4GB Ram/64GB Memory',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      10.heightBox,
                                      const Text(
                                        'Price 14000',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 220),
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/tShirt.jpg',
                                    width: 250,
                                    fit: BoxFit.fill,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Price 200',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  5.heightBox,
                                  const Text(
                                    'Available Color : 4 ',
                                    style: TextStyle(
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
                            );
                          },
                        ),
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
