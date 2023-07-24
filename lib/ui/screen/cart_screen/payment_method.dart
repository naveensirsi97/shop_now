import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/list.dart';
import 'package:shop_now/controller/cart_controller.dart';
import 'package:shop_now/ui/screen/home_screen/home.dart';
import 'package:shop_now/widget/button.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Choose Payment Method',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: controller.placingOrder.value
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                )
              : button(
                  onPressed: () async {
                    await controller.placeMyOrder(
                        orderPaymentMethod:
                            paymentMethods[controller.paymentIndex.value],
                        totalAmount: controller.totalP.value);

                    await controller.clearCart();
                    VxToast.show(context, msg: 'Order Placed Successfully');

                    Get.offAll(const Home());
                  },
                  color: redColor,
                  textColor: Colors.white,
                  title: 'Place your order'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: List.generate(
                paymentMethodImg.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changePaymentIndex(index);
                    },
                    child: Card(
                      child: Container(
                        // margin: const EdgeInsets.only(bottom: 8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            //    borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: controller.paymentIndex.value == index
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 4)),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(
                              paymentMethodImg[index],
                              width: double.infinity,
                              height: 120,
                              colorBlendMode:
                                  controller.paymentIndex.value == index
                                      ? BlendMode.darken
                                      : BlendMode.color,
                              color: controller.paymentIndex.value == index
                                  ? Colors.grey.withOpacity(1)
                                  : Colors.transparent,
                              fit: BoxFit.cover,
                            ),
                            controller.paymentIndex.value == index
                                ? Transform.scale(
                                    scale: 1.4,
                                    child: Checkbox(
                                        activeColor: Colors.greenAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        value: true,
                                        onChanged: (value) {}),
                                  )
                                : Container(),
                            Positioned(
                                bottom: 5,
                                right: 10,
                                child: Text(
                                  paymentMethods[index],
                                  style: const TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
