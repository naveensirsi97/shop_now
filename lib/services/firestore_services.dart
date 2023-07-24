import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_now/constant/firebase_consts.dart';

class FirestoreServices {
  // get users data

  static getUser(uid) {
    // return fireStore
    //     .collection(usersCollection)
    //     .where('id', isEqualTo: uid)
    //     .snapshots();
    return FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(auth.currentUser!.uid)
        .snapshots();
  }

  // get product acc to category

  static Future<QuerySnapshot<Map<String, dynamic>>> getProduct(category) {
    return FirebaseFirestore.instance
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .get();
  }

  static getSubCategoryProducts(title) {
    fireStore
        .collection(productsCollection)
        .where('p_sabcategory', isEqualTo: title)
        .snapshots();
  }

  // static getProduct(category) {
  //   // return fireStore
  //   //     .collection(productsCollection)
  //   //     .where('p_category', isEqualTo: category)
  //   //     .snapshots();
  //   return FirebaseFirestore.instance
  //       .collection(productsCollection)
  //       .doc(category)
  //       .get();
  // }

  // get cart
  static getCart(uid) {
    return fireStore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete document

  static deleteDocument(docId) {
    return fireStore.collection(cartCollection).doc(docId).delete();
  }

  //get all chat messages

  static getChatMessages(docId) {
    return fireStore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrders() {
    return fireStore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  static getWishList() {
    return fireStore
        .collection(productsCollection)
        .where('p_wishList', arrayContains: auth.currentUser!.uid)
        .snapshots();
  }

  static getAllMessages() {
    return fireStore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  static getCounts() async {
    var res = await Future.wait([
      fireStore
          .collection(cartCollection)
          .where('added_by', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      fireStore
          .collection(productsCollection)
          .where('p_wishList', arrayContains: auth.currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      fireStore
          .collection(ordersCollection)
          .where('order_by', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      })
    ]);
    return res;
  }

  static allProducts() {
    return fireStore.collection(productsCollection).snapshots();
  }

  static getFeaturedProducts() {
    return fireStore
        .collection(productsCollection)
        .where('is_featured', isEqualTo: true)
        .get();
  }

  static searchProducts(title) {
    return fireStore.collection(productsCollection).get();
  }
}
