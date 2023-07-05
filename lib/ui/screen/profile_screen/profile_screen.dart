import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/ui/screen/login_screen.dart';
import 'package:emart_app/widget/profile_button.dart';
import 'package:emart_app/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                color: redColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    50.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Naveen Sheoran',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              2.heightBox,
                              const Text(
                                'naveensirsi97@gmail.com',
                                style: TextStyle(
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
                    20.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileCard(
                              count: '00',
                              title: 'in your cart',
                              width: MediaQuery.of(context).size.width / 3.5,
                              onPressed: () {}),
                          profileCard(
                              count: '30',
                              title: 'in your wishList',
                              width: MediaQuery.of(context).size.width / 3.0,
                              onPressed: () {}),
                          profileCard(
                              count: '02',
                              title: 'your order',
                              width: MediaQuery.of(context).size.width / 3.5,
                              onPressed: () {})
                        ]),
                    //20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => profileButton(
                              onPressed: () {},
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width / 3.5,
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
              top: 280,
              left: 5,
              right: 5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  //  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
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
                ),
              )),
        ],
      ),
    );
  }
}
