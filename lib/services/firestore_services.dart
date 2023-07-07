import 'package:emart_app/constant/firebase_consts.dart';

class FirestoreServices {
  // get users data

  static getUser(uid) {
    return fireStore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
