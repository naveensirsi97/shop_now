import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/controller/cart_controller.dart';
import 'package:emart_app/ui/screen/cart_screen/payment_method.dart';
import 'package:emart_app/widget/button.dart';
import 'package:emart_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        // automaticallyImplyLeading: false,
        title: const Text(
          'Shipping Info',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: button(
            onPressed: () {
              if (controller.addressController.text.isNotEmpty &&
                  controller.cityController.text.isNotEmpty &&
                  controller.stateController.text.isNotEmpty &&
                  controller.postalCodeController.text.isNotEmpty &&
                  controller.phoneController.text.isNotEmpty) {
                Get.to(() => const PaymentMethod());
              } else {
                VxToast.show(context, msg: 'Please fill all category ');
              }
            },
            color: redColor,
            textColor: Colors.white,
            title: 'Continue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextField(
                  hint: 'Address',
                  isPass: false,
                  title: 'Address',
                  controller: controller.addressController),
              customTextField(
                  hint: 'City',
                  isPass: false,
                  title: 'City',
                  controller: controller.cityController),
              customTextField(
                  hint: 'State',
                  isPass: false,
                  title: 'State',
                  controller: controller.stateController),
              customTextField(
                  hint: 'Postal Code',
                  isPass: false,
                  title: 'Postal Code',
                  controller: controller.postalCodeController),
              customTextField(
                  hint: 'Phone',
                  isPass: false,
                  title: 'Phone',
                  controller: controller.phoneController),
            ],
          ),
        ),
      ),
    );
  }
}
