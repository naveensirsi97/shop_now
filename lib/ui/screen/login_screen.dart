import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/ui/screen/signup_screen.dart';
import 'package:emart_app/widget/button.dart';
import 'package:emart_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      80.heightBox,
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/emartlogo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      10.heightBox,
                      const Text(
                        loginToeMart,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 250,
              left: 20,
              right: 20,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //    boxShadow:  const [BoxShadow(spreadRadius: 2.0,color: Colors.black12)],
                        borderRadius: BorderRadius.circular(16)),
                    child: Expanded(
                      child: Obx(
                        () => Column(
                          children: [
                            customTextField(
                              hint: emailHint,
                              title: email,
                              isPass: false,
                              controller: controller.emailController,
                            ),
                            customTextField(
                              hint: passwordHint,
                              title: password,
                              isPass: true,
                              controller: controller.passwordController,
                            ),
                            5.heightBox,
                            Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(forgetPassword))),
                            5.heightBox,
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(redColor),
                                    )
                                  : button(
                                      title: 'Log In',
                                      onPressed: () async {
                                        controller.isLoading(true);
                                        await controller
                                            .loginMethod(context: context)
                                            .then((value) {
                                          if (value != null) {
                                            VxToast.show(context,
                                                msg: loggedIn);
                                            Get.offAll(() => const Home());
                                          } else {
                                            controller.isLoading(false);
                                          }
                                        });
                                      },
                                      color: redColor,
                                      textColor: Colors.white,
                                    ),
                            ),
                            5.heightBox,
                            const Text(createNewAccount),
                            5.heightBox,
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: button(
                                title: 'Sign up',
                                onPressed: () {
                                  Get.to(() => const SignupScreen());
                                },
                                color: Colors.orangeAccent,
                                textColor: Colors.white,
                              ),
                            ),
                            5.heightBox,
                            const Text(loginWith),
                            5.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                3,
                                (index) => CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 30,
                                  child: socialIconList[index],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
