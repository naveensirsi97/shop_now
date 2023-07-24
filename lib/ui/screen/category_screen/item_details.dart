import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/list.dart';
import 'package:shop_now/controller/product_controller.dart';
import 'package:shop_now/ui/screen/chat_screen/chat_screen.dart';
import 'package:shop_now/widget/button.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({
    super.key,
    required this.title,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: redColor,
          //backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              controller.resetValues();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            title!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            Obx(
              () => IconButton(
                onPressed: () {
                  if (controller.isFav.value) {
                    controller.removeFromWishList(data.id, context);
                    // controller.isFav(false);
                  } else {
                    controller.addToWishList(data.id, context);
                    //   controller.isFav(true);
                  }
                },
                icon: Icon(
                  Icons.favorite_outlined,
                  color: controller.isFav.value ? Colors.orange : Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 280,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        itemCount: data['p_imgs'].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_imgs'][index],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          );
                          //  Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   margin: const EdgeInsets.symmetric(horizontal: 8),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(16),
                          //     image: DecorationImage(
                          //       image: AssetImage(slidersList[index]),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      20.heightBox,
                      Text(
                        title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      10.heightBox,
                      VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value) {},
                        count: 5,
                        maxRating: 5,
                        normalColor: Colors.blueGrey,
                        selectionColor: Colors.amber,
                        size: 25,
                        //  stepInt: true,false,
                      ),
                      10.heightBox,
                      Text(
                        '${data['p_price']}'.numCurrency,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: redColor),
                      ),
                      10.heightBox,
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Seller",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                5.heightBox,
                                Text(
                                  '${data['p_seller']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message),
                            ).onTap(() {
                              Get.to(
                                () => const ChatScreen(),
                                arguments: [
                                  data['p_seller'],
                                  data['vendor_id'],
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                      20.heightBox,
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Color:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.grey),
                                    ),
                                    50.widthBox,
                                    Row(
                                      children: List.generate(
                                        data['p_colors'].length,
                                        (index) => Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            VxBox()
                                                .size(40, 40)
                                                .roundedFull
                                                .color(Color(
                                                        data['p_colors'][index])
                                                    .withOpacity(1.0))
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4))
                                                .make()
                                                .onTap(() {
                                              // controller
                                              //     .changeColorIndex(index);
                                              controller.colorIndex.value =
                                                  index;
                                            }),
                                            Visibility(
                                                visible: index ==
                                                    controller.colorIndex.value,
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                20.heightBox,
                                Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Quantity:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey),
                                      ),
                                      30.widthBox,
                                      Obx(
                                        () => Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.decreaseQuantity();
                                                  controller
                                                      .calculateTotalPrice(
                                                          int.parse(
                                                              data['p_price']));
                                                },
                                                icon: const Icon(Icons.remove)),
                                            Text(
                                              '${controller.quantity.value}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  controller.increaseQuantity(
                                                      int.parse(
                                                          data['p_quantity']));
                                                  controller
                                                      .calculateTotalPrice(
                                                          int.parse(
                                                              data['p_price']));
                                                },
                                                icon: const Icon(Icons.add)),
                                            10.widthBox,
                                            Text(
                                              '[${data['p_quantity']} available ]',
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                20.heightBox,
                                Container(
                                  color: Colors.greenAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Total:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Colors.grey),
                                        ),
                                        60.widthBox,
                                        Text(
                                          '${controller.totalPrice.value}'
                                              .numCurrency,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.heightBox,
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black54),
                              ),
                              5.heightBox,
                              Text(
                                '${data['p_description']}',
                                style: const TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          itemDetailsButtonList.length,
                          (index) => Card(
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(
                                  itemDetailsButtonList[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Product You May Also Likes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  6,
                                  (index) => Card(
                                    child: Container(
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
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: button(
                title: 'Add To Card',
                color: redColor,
                textColor: Colors.white,
                onPressed: () {
                  // controller.addToCart(
                  //     color: data['p_colors'][controller.colorIndex.value],
                  //     context: context,
                  //     img: data['p_imgs'][0],
                  //     qty: controller.quantity.value,
                  //     sellerName: data['p_seller'],
                  //     title: data['p_name'],
                  //     tPrice: controller.totalPrice.value);
                  // VxToast.show(context, msg: 'Added to Cart');
                  //    print('data[p_colors]: ${data['p_colors']}');
                  //     print('colorIndex: ${controller.colorIndex.value}');
                  if (controller.quantity.value > 0) {
                    if (data['p_colors'] != null &&
                        controller.colorIndex.value < data['p_colors'].length) {
                      controller.addToCart(
                        color: data['p_colors'][controller.colorIndex.value],
                        context: context,
                        img: data['p_imgs'][0],
                        vendorID: data['vendor_id'],
                        qty: controller.quantity.value,
                        sellerName: data['p_seller'],
                        title: data['p_name'],
                        tPrice: controller.totalPrice.value,
                      );
                      VxToast.show(context, msg: 'Added to Cart');
                    } else {
                      // Handle error when color index is out of range or data['p_colors'] is null
                      print('Invalid color index or null ${data['p_colors']}');
                    }
                  } else {
                    VxToast.show(context, msg: 'Please Select Quantity');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
