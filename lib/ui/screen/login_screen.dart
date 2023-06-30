import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:emart_app/constant/string_const.dart';
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
                   //    boxShadow:  const [BoxShadow(spreadRadius: 2.0,color: Colors.black12)],
                        borderRadius: BorderRadius.circular(16)),
                    child: Expanded(
                      child: Column(
                        children: [
                          customTextField(hint: emailHint, title: email),
                          customTextField(hint: passwordHint, title: password),
                          5.heightBox,
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(forgetPassword))),
                          5.heightBox,
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: button(
                              title: 'Log In',
                              onPressed: () {
                                Get.to(() =>  Home());
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
              )),
        ],
      ),
    );
  }
}
