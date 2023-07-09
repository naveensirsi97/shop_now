import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Shopping cart',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.redAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(4)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '40.0',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: button(
                    color: redColor,
                    onPressed: () {},
                    title: 'Proceed To Shipping',
                    textColor: Colors.white),
              ),
            ],
          ),
        ));
  }
}
