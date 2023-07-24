import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/constant/color_const.dart';
import 'package:shop_now/constant/firebase_consts.dart';
import 'package:shop_now/constant/string_const.dart';
import 'package:shop_now/controller/auth_controller.dart';
import 'package:shop_now/ui/screen/home_screen/home.dart';
import 'package:shop_now/widget/button.dart';
import 'package:shop_now/widget/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var confirmPasswordController = TextEditingController();

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
                        joinToShopNow,
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
                      borderRadius: BorderRadius.circular(16)),
                  child: Expanded(
                    child: Obx(
                      () => Column(
                        children: [
                          customTextField(
                            hint: nameHint,
                            title: name,
                            controller: nameController,
                            isPass: false,
                          ),
                          customTextField(
                            hint: emailHint,
                            title: email,
                            controller: emailController,
                            isPass: false,
                          ),
                          customTextField(
                            hint: passwordHint,
                            title: password,
                            controller: passwordController,
                            isPass: false,
                          ),
                          customTextField(
                            hint: passwordHint,
                            title: confirmPassword,
                            controller: confirmPasswordController,
                            isPass: false,
                          ),
                          5.heightBox,
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.red,
                                value: isCheck,
                                onChanged: (newValue) {
                                  setState(() {
                                    isCheck = newValue;
                                  });
                                },
                              ),
                              10.widthBox,
                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: termAndCondition,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      TextSpan(
                                        text: '&',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: privacyPolicy,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          5.heightBox,
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(redColor),
                                  )
                                : button(
                                    title: signup,
                                    color: isCheck == true
                                        ? redColor
                                        : Colors.black12,
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      controller.isLoading(true);
                                      if (isCheck != false) {
                                        try {
                                          await controller
                                              .signupMethod(
                                                  context: context,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text)
                                              .then((value) {
                                            return controller.storeUserData(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                name: nameController.text);
                                          }).then((value) {
                                            VxToast.show(context,
                                                msg: loggedIn);
                                            Get.offAll(() => const Home());
                                          });
                                        } catch (e) {
                                          auth.signOut();
                                          VxToast.show(context,
                                              msg: e.toString());
                                          controller.isLoading(false);
                                        }
                                      }
                                    },
                                  ),
                          ),
                          5.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(alreadyAccount),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    login,
                                    style: TextStyle(
                                        color: redColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
