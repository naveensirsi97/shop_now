import 'dart:io';

import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/widget/button.dart';
import 'package:emart_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                //  margin: const EdgeInsets.only(right: 12, left: 12),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),
                ]),
                child: Obx(
                  () => Column(
                    children: [
                      data['imageUrl'] == '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.asset(
                              'assets/images/mobile.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : data['imageUrl'] != '' &&
                                  controller.profileImgPath.isEmpty
                              ? Image.network(
                                  data['imageUrl'],
                                  width: 80,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.file(
                                  File(controller.profileImgPath.value),
                                  width: 80,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),

                      //  CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: Colors.white,
                      //   backgroundImage: controller.profileImgPath.isEmpty? const AssetImage('assets/images/mobile.jpg'):Image.file(File(controller.profileImgPath.value)),
                      // ),
                      10.heightBox,
                      button(
                        color: redColor,
                        title: change,
                        textColor: Colors.white,
                        onPressed: () {
                          //  Get.find<ProfileController>().changeImage(context);
                          controller.changeImage(context);
                        },
                      ),
                      20.heightBox,
                      customTextField(
                        hint: 'New Name',
                        title: 'Name',
                        isPass: false,
                        controller: controller.nameController,
                      ),
                      10.heightBox,
                      customTextField(
                        hint: 'Input Old Password',
                        title: 'Old Password',
                        isPass: true,
                        controller: controller.oldPasswordController,
                      ),
                      10.heightBox,
                      customTextField(
                        hint: 'Input New Password',
                        title: 'New Password',
                        isPass: true,
                        controller: controller.newPasswordController,
                      ),
                      20.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: button(
                                  onPressed: () async {
                                    controller.isLoading(true);

                                    if (controller
                                        .profileImgPath.value.isNotEmpty) {
                                      await controller.uploadProfileImage();
                                    } else {
                                      controller.profileImageLink =
                                          data['imageUrl'];
                                    }

                                    if (data['password'] ==
                                        controller.oldPasswordController.text) {
                                      await controller.changeAuthPassword(
                                        email: data['email'],
                                        password: controller
                                            .oldPasswordController.text,
                                        newPassword: controller
                                            .newPasswordController.text,
                                      );

                                      await controller.updateProfile(
                                        imgUrl: controller.profileImageLink,
                                        name: controller.nameController.text,
                                        password: controller
                                            .newPasswordController.text,
                                      );
                                      VxToast.show(context, msg: 'Updated');
                                    } else {
                                      VxToast.show(context,
                                          msg: 'Wrong Old Password');
                                      controller.isLoading(false);
                                    }
                                  },
                                  color: redColor,
                                  textColor: Colors.white,
                                  title: 'Save'),
                            ),
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
