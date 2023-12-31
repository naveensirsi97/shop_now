import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/firebase_consts.dart';
import 'package:shop_now/model/category_model.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  var isFav = false.obs;

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart(
      {title, img, sellerName, color, qty, tPrice, context, vendorID}) async {
    await fireStore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellerName': sellerName,
      'color': color,
      'qty': qty,
      'vendor_id': vendorID,
      'tPrice': tPrice,
      'added_by': auth.currentUser!.uid,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }

  addToWishList(docId, context) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'p_wishList': FieldValue.arrayUnion([auth.currentUser!.uid]),
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: 'Added to wishList');
  }

  removeFromWishList(docId, context) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'p_wishList': FieldValue.arrayRemove([auth.currentUser!.uid]),
    }, SetOptions(merge: true));

    isFav(false);
    VxToast.show(context, msg: 'Removed from wishList');
  }

  checkIfFav(data) async {
    if (data['p_wishList'].contains(auth.currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}
