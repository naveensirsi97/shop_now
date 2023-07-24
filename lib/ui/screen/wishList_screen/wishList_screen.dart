import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/firebase_consts.dart';
import 'package:shop_now/services/firestore_services.dart';
import 'package:velocity_x/velocity_x.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'My WishList',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishList(),
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
                'No Item In WishList',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          '${data[index]['p_imgs'][0]}',
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          '${data[index]['p_name']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        subtitle: Text(
                          '${data[index]['p_price']}'.numCurrency,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                        trailing: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ).onTap(() {
                          fireStore
                              .collection(productsCollection)
                              .doc(data[index].id)
                              .set({
                            'p_wishList':
                                FieldValue.arrayRemove([auth.currentUser!.uid])
                          }, SetOptions(merge: true));
                        }),
                      );
                    }),
              ],
            );
          }
        },
      ),
    );
  }
}
