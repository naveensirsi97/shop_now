import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/firebase_consts.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUserName();
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  var userName = '';
  var searchController = TextEditingController();

  getUserName() async {
    var n = await fireStore
        .collection(usersCollection)
        .where('id', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
    userName = n;
    // print(userName);
  }
}
