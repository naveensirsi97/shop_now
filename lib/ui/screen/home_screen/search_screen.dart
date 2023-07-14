import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/ui/screen/category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: FirestoreServices.searchProducts(title),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'Not Found',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              var filtered = data
                  .where(
                    (element) => element['p_name']
                        .toString()
                        .toLowerCase()
                        .contains(title!.toLowerCase()),
                  )
                  .toList();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  children: filtered
                      .mapIndexed(
                        (currentValue, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                filtered[index]['p_imgs'][0],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              Text(
                                '${filtered[index]['p_name']}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              10.heightBox,
                              Text(
                                "${filtered[index]['p_price']}".numCurrency,
                                style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ).onTap(() {
                          Get.to(() => ItemDetails(
                                title: '${filtered[index]['p_name']}',
                                data: filtered[index],
                              ));
                        }),
                      )
                      .toList(),
                ),
              );
            }
          },
        ));
  }
}
