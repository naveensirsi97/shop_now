import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/string_const.dart';
import 'package:emart_app/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 void changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(() => const LoginScreen());
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            200.heightBox,
             Container(
                 height: 100,
                 width: 100,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   image: const DecorationImage(
                     image: AssetImage('assets/images/emartlogo.png'),
                     fit: BoxFit.fill,
                   ),
                 ),),
            20.heightBox,
            const Text(
              appName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            10.heightBox,
            const Text(
              version,
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            const Text(credit, style: TextStyle(color: Colors.white)),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}