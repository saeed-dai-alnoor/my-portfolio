import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final mySystemTheme = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/saeed.jpeg',
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(58.0),
                  child: Lottie.asset(
                    'assets/animations/appLoading.json',
                    width: 125,
                    height: 125,
                    fit: BoxFit.fill,
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
