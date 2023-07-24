import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/string_const.dart';
import 'package:shop_now/controller/home_controller.dart';
import 'package:shop_now/ui/screen/cart_screen/cart_screen.dart';
import 'package:shop_now/ui/screen/category_screen/category_screen.dart';
import 'package:shop_now/ui/screen/home_screen/home_screen.dart';
import 'package:shop_now/ui/screen/profile_screen/profile_screen.dart';
import 'package:shop_now/widget/exit_dialog.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category), label: category),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: cart),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_box), label: account)
    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            items: navBarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
        body: Column(
          children: [
            Obx(() => Expanded(
                  child: navBody.elementAt(
                    controller.currentNavIndex.value,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
