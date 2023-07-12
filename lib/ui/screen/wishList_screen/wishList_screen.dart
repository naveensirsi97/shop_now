import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:flutter/material.dart';

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
                'No WishList Yet!',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
