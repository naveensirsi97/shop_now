import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/services/firestore_services.dart';
import 'package:shop_now/ui/screen/order_screen/order_details.dart';
import 'package:velocity_x/velocity_x.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Orders Yet!',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    title: Text(
                      '${data[index]['order_code']}',
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${data[index]['total_amount']}'.numCurrency,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => OrderDetails(
                              data: data[index].data(),
                            ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
