// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/constant/color_const.dart';
// import 'package:emart_app/controller/product_controller.dart';
// import 'package:emart_app/services/firestore_services.dart';
// import 'package:emart_app/ui/screen/category_screen/item_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class CategoryDetails extends StatelessWidget {
//   final String? title;
//
//   const CategoryDetails({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProductController>();
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: redColor,
//           // forceMaterialTransparency: true,
//           title: Text(
//             title!,
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ),
//         body: StreamBuilder(
//           stream: FirestoreServices.getProduct(title),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation(Colors.red),
//                 ),
//               );
//             } else if (snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text(
//                   'No Product Found',
//                   style: TextStyle(color: redColor),
//                 ),
//               );
//             } else {
//               var data = snapshot.data!.docs;
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 40,
//                     color: redColor,
//                     child: Expanded(
//                       child: SingleChildScrollView(
//                         //      physics: const NeverScrollableScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: List.generate(
//                               controller.subcat.length,
//                               (index) => Container(
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 4, vertical: 4),
//                                     padding: const EdgeInsets.all(8),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(16)),
//                                     child: Center(
//                                         child: Text(
//                                       '${controller.subcat[index]}',
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     )),
//                                   )),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: GridView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: data.length,
//                         shrinkWrap: true,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 8,
//                           crossAxisSpacing: 4,
//                           mainAxisExtent: 250,
//                         ),
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               Get.to(() => ItemDetails(
//                                     title: '${data[index]['p_name']}',
//                                     data: data[index],
//                                   ));
//                             },
//                             child: Card(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.network(
//                                     data[index]['p_imgs'][0],
//                                     //         categoryImageList[index],
//                                     height: 200,
//                                     width: 200,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   5.heightBox,
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '${data[index]['p_name']}',
//                                       //  categoryList[index],
//                                       style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ),
//                                   3.heightBox,
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '${data[index]['p_price']}'.numCurrency,
//                                       //  categoryList[index],
//                                       style: const TextStyle(
//                                         color: Colors.redAccent,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             }
//           },
//         ));
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/constant/color_const.dart';
// import 'package:emart_app/controller/product_controller.dart';
// import 'package:emart_app/services/firestore_services.dart';
// import 'package:emart_app/ui/screen/category_screen/item_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class CategoryDetails extends StatelessWidget {
//   final String? title;
//
//   const CategoryDetails({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProductController>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: redColor,
//         title: Text(
//           title!,
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirestoreServices.getProduct(title),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(Colors.red),
//               ),
//             );
//           } else if (!snapshot.data!.exists) {
//             return const Center(
//               child: Text(
//                 'No Product Found',
//                 style: TextStyle(color: redColor),
//               ),
//             );
//           } else {
//             var data = snapshot.data!;
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   color: redColor,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: List.generate(
//                         controller.subcat.length,
//                         (index) => Container(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 4, vertical: 4),
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '${controller.subcat[index]}',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: 1, // Only one document
//                       shrinkWrap: true,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 8,
//                         crossAxisSpacing: 4,
//                         mainAxisExtent: 250,
//                       ),
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             Get.to(() => ItemDetails(
//                                   title: '${data['p_name']}',
//                                   data: data,
//                                 ));
//                           },
//                           child: Card(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   data['p_imgs'][0],
//                                   height: 200,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 5.heightBox,
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     '${data['p_name']}',
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
//                                 3.heightBox,
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     '${data['p_price']}'.numCurrency,
//                                     style: const TextStyle(
//                                       color: Colors.redAccent,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/constant/color_const.dart';
// import 'package:emart_app/controller/product_controller.dart';
// import 'package:emart_app/services/firestore_services.dart';
// import 'package:emart_app/ui/screen/category_screen/item_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class CategoryDetails extends StatelessWidget {
//   final String? title;
//
//   const CategoryDetails({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProductController>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: redColor,
//         title: Text(
//           title!,
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: FutureBuilder(
//         future: FirestoreServices.getProduct(title),
//         builder: (BuildContext context,
//             AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(Colors.red),
//               ),
//             );
//           } else if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(
//               child: Text(
//                 'No Product Found',
//                 style: TextStyle(color: redColor),
//               ),
//             );
//           } else {
//             var data = snapshot.data!;
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   color: redColor,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: List.generate(
//                         controller.subcat.length,
//                         (index) => Container(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 4, vertical: 4),
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '${controller.subcat[index]}',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: 1, // Only one document
//                       shrinkWrap: true,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 8,
//                         crossAxisSpacing: 4,
//                         mainAxisExtent: 250,
//                       ),
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             Get.to(() => ItemDetails(
//                                   title: '${data['p_name']}',
//                                   data: data,
//                                 ));
//                           },
//                           child: Card(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   data['p_imgs'][0],
//                                   height: 200,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 5.heightBox,
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     '${data['p_name']}',
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
//                                 3.heightBox,
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     '${data['p_price']}'.numCurrency,
//                                     style: const TextStyle(
//                                       color: Colors.redAccent,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

//chat gpt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/ui/screen/category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;

  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    switchCategory(widget.title);
    super.initState();
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      productMethod = FirestoreServices.getSubCategoryProducts(title);
    } else {
      productMethod = FirestoreServices.getProduct(title);
    }
  }

  var controller = Get.find<ProductController>();

  late dynamic productMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text(
          widget.title!,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.subcat.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      switchCategory('${controller.subcat[index]}');
                    });
                  },
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          '${controller.subcat[index]}',
                          style: const TextStyle(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          10.heightBox,
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: productMethod,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Error loading products',
                    style: TextStyle(color: redColor),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'No Products Found',
                    style: TextStyle(
                        color: redColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                );
              } else {
                var products = snapshot.data!.docs;
                return Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 4,
                        mainAxisExtent: 280,
                      ),
                      itemBuilder: (context, index) {
                        //   var product = products[index];
                        return InkWell(
                          onTap: () {
                            controller.checkIfFav(products[index]);
                            Get.to(() => ItemDetails(
                                  title: '${products[index]['p_name']}',
                                  data: products[index], //!
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    products[index]['p_imgs'][0] as String,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  5.heightBox,
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      products[index]['p_name'] as String,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  3.heightBox,
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${products[index]['p_price']}'
                                          .numCurrency,
                                      style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
