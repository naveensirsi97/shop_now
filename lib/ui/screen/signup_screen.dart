import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/widget/button.dart';
import 'package:emart_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: redColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      30.heightBox,
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
                        joinToeMart,
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
            top: 180,
            left: 50,
            right: 50,
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
                    child: Column(
                      children: [
                        customTextField(hint: nameHint, title: name),
                        customTextField(hint: emailHint, title: email),
                        customTextField(hint: passwordHint, title: password),
                        customTextField(
                            hint: passwordHint, title: confirmPassword),
                        5.heightBox,
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(forgetPassword))),
                        5.heightBox,
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck= newValue;
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
                          child: button(
                            title: 'Sign Up',
                            onPressed: () {},
                            color: isCheck== true ? redColor : Colors.black12,
                            textColor: Colors.white,
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
                                  style: TextStyle(color: redColor,fontSize: 16,fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
