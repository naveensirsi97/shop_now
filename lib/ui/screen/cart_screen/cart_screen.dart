import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/firebase_consts.dart';
import 'package:shop_now/controller/cart_controller.dart';
import 'package:shop_now/services/firestore_services.dart';
import 'package:shop_now/ui/screen/cart_screen/shipping_screen.dart';
import 'package:shop_now/widget/button.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 40,
          child: button(
              color: redColor,
              onPressed: () {
                Get.to(() => const ShippingScreen());
                // if (controller.productSnapshot.isNotEmpty) {
                //   Get.to(() => const ShippingScreen());
                // }
              },
              title: 'Proceed To Shipping',
              textColor: Colors.white),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Shopping cart',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'Cart is empty',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              controller.productSnapshot = data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.network(
                                '${data[index]['img']}',
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                '${data[index]['title']} (${data[index]['qty']})',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              subtitle: Text(
                                '${data[index]['tPrice']}'.numCurrency,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              trailing: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ).onTap(() {
                                FirestoreServices.deleteDocument(
                                    data[index].id);
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Obx(
                            () => Text(
                              '${controller.totalP.value}',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width - 30,
                    //   child: button(
                    //       color: redColor,
                    //       onPressed: () {},
                    //       title: 'Proceed To Shipping',
                    //       textColor: Colors.white),
                    // ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
