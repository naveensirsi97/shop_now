import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/firebase_consts.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/ui/screen/chat_screen/messaging_screen.dart';
import 'package:emart_app/ui/screen/login_screen.dart';
import 'package:emart_app/ui/screen/order_screen/order_screen.dart';
import 'package:emart_app/ui/screen/profile_screen/edit_profile.dart';
import 'package:emart_app/ui/screen/wishList_screen/wishList_screen.dart';
import 'package:emart_app/widget/profile_button.dart';
import 'package:emart_app/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirestoreServices.getUser(auth.currentUser!.uid),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData && (snapshot.data?.exists ?? false)) {
            DocumentSnapshot document = snapshot.data!;
            // access the document's data
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return body(context, controller, data);
          } else if (snapshot.hasData && !(snapshot.data?.exists ?? false)) {
            return const Center(
              child: Text('Document does not exist'),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          }
        },
      ),
    );
  }

  Stack body(BuildContext context, ProfileController controller, data) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: redColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  30.heightBox,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 16.0, vertical: 4.0),
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: InkWell(
                  //       onTap: () {
                  //         controller.nameController.text = data['name'];
                  //
                  //         Get.to(() => EditProfile(
                  //               data: data,
                  //             ));
                  //       },
                  //       child: const Icon(
                  //         Icons.edit,
                  //         color: Colors.white,
                  //         size: 20,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                'assets/images/mobile.jpg',
                                width: 60,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 60,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['name']}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            2.heightBox,
                            Text(
                              '${data['email']}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () async {
                            await Get.put(AuthController()).signOut(context);
                            Get.offAll(() => const LoginScreen());
                          },
                          child: const Text(
                            'LogOut',
                            style: TextStyle(
                                color: Colors.white,
// fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      profileCard(
                        count: data['cart_count'],
                        title: 'in your cart',
                        width: MediaQuery.of(context).size.width / 3.5,
                        onPressed: () {},
                      ),
                      profileCard(
                        count: data['wishList_count'],
                        title: 'in your wishList',
                        width: MediaQuery.of(context).size.width / 3.0,
                        onPressed: () {},
                      ),
                      profileCard(
                        count: data['order_count'],
                        title: 'your order',
                        width: MediaQuery.of(context).size.width / 3.5,
                        onPressed: () {},
                      )
                    ],
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      profileButton(
                          title: language,
                          icon: const Icon(
                            (Icons.language_outlined),
                            color: Colors.white70,
                            size: 24,
                          ),
                          onPressed: () {
                            //     Get.to(() => ChatScreen());
                          }),
                      profileButton(
                          title: editProfile,
                          icon: const Icon(
                            (Icons.edit_note),
                            color: Colors.white70,
                            size: 32,
                          ),
                          onPressed: () {
                            controller.nameController.text = data['name'];

                            Get.to(() => EditProfile(
                                  data: data,
                                ));
                          }),
                      profileButton(
                          title: location,
                          icon: const Icon(
                            (Icons.add_location_outlined),
                            color: Colors.white70,
                            size: 24,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 300,
          left: 4,
          right: 4,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              // separatorBuilder: (context,index){
              //   return Container(color: Colors.grey);
              // },
              itemCount: profileButtonList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.to(() => const OrdersScreen());
                        break;
                      case 1:
                        Get.to(() => const WishListScreen());
                        break;
                      case 2:
                        Get.to(() => const MessagesScreen());
                        break;
                    }
                  },
                  leading: Image.asset(
                    profileButtonIcon[index],
                    width: 20,
                    fit: BoxFit.fill,
                  ),
                  title: Text(profileButtonList[index]),
                  trailing: const Icon(Icons.arrow_forward),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
