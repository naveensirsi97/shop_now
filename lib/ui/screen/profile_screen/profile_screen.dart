import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/firebase_consts.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/ui/screen/login_screen.dart';
import 'package:emart_app/ui/screen/profile_screen/edit_profile.dart';
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
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
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
                            50.heightBox,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    controller.nameController.text =
                                        data['name'];

                                    Get.to(() => EditProfile(
                                          data: data,
                                        ));
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  data['imageUrl'] == ''
                                      ? Image.asset(
                                          'assets/images/mobile.jpg',
                                          width: 80,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make()
                                      : Image.network(
                                          data['imageUrl'],
                                          width: 70,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make(),
                                  10.widthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      await Get.put(AuthController())
                                          .signOut(context);
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
                            10.heightBox,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  profileCard(
                                    count: data['cart_count'],
                                    title: 'in your cart',
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    onPressed: () {},
                                  ),
                                  profileCard(
                                    count: data['wishList_count'],
                                    title: 'in your wishList',
                                    width:
                                        MediaQuery.of(context).size.width / 3.0,
                                    onPressed: () {},
                                  ),
                                  profileCard(
                                    count: data['order_count'],
                                    title: 'your order',
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    onPressed: () {},
                                  )
                                ]),
                            //  20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  3,
                                  (index) => profileButton(
                                      onPressed: () {},
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      title: index == 0
                                          ? language
                                          : index == 1
                                              ? editProfile
                                              : location,
                                      icon: index == 0
                                          ? const Icon(
                                              (Icons.language_outlined),
                                              color: Colors.white70,
                                              size: 24,
                                            )
                                          : index == 1
                                              ? const Icon(
                                                  (Icons.edit_note),
                                                  color: Colors.white70,
                                                  size: 30,
                                                )
                                              : const Icon(
                                                  (Icons.add_location_outlined),
                                                  color: Colors.white70,
                                                  size: 24,
                                                ))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 350,
                      left: 5,
                      right: 5,
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
                                leading: Image.asset(
                                  profileButtonIcon[index],
                                  width: 20,
                                  fit: BoxFit.fill,
                                ),
                                title: Text(profileButtonList[index]),
                                trailing: const Icon(Icons.arrow_forward),
                              );
                            }),
                      )),
                ],
              );
            }
          },
        ));
  }
}
