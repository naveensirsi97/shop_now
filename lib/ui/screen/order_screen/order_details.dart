import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/ui/screen/order_screen/components/order_place_details.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/order_status.dart';

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Order Details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              orderStatus(
                color: Colors.redAccent,
                icon: Icons.done_outlined,
                title: 'Placed',
                showDone: data != null ? data['order_placed'] ?? false : true,
              ),
              orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: 'Confirmed',
                showDone:
                    data != null ? data['order_confirmed'] ?? false : false,
              ),
              orderStatus(
                color: Colors.amberAccent,
                icon: Icons.car_rental,
                title: 'On Delivery',
                showDone:
                    data != null ? data['order_on_delivery'] ?? false : false,
              ),
              orderStatus(
                color: Colors.purple,
                icon: Icons.done_all,
                title: 'Delivered',
                showDone:
                    data != null ? data['order_delivered'] ?? false : false,
              ),
              const Divider(),
              Container(
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                  ),
                ]),
                child: Column(
                  children: [
                    orderPlaceDetails(
                        title1: "Order Code",
                        d1: "${data?['order_code']}",
                        title2: 'Shipping Method',
                        d2: "${data?['shipping_method']}"),
                    orderPlaceDetails(
                        title1: "Order Date",
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format((data['order_date'].toDate())),
                        title2: 'Payment Method',
                        d2: "${data?['payment_method']}"),
                    orderPlaceDetails(
                      title1: "Payment Status",
                      d1: 'Unpaid',
                      title2: 'Delivery Status',
                      d2: 'Order Placed',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Shipping Address',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${data?['order_by_name']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_email']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_address']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_city']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_state']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_phone']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                              Text(
                                "${data?['order_by_postalCode']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: redColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${data?['total_amount']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: redColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //   const Divider(),

              10.heightBox,
              const Center(
                child: Text(
                  'Ordered Product',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              10.heightBox,
              Container(
                //  margin: EdgeInsets.only(bottom: 22),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                  ),
                ]),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(data['orders'].length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          title1: '${data['orders'][index]['title']}',
                          title2: '${data['orders'][index]['tPrice']}',
                          d1: '${data['orders'][index]['qty']}x',
                          d2: 'Refundable',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(data['orders'][index]['color']),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
