import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void _checkAuth() async {
    await Future.delayed(Duration(milliseconds: 700)); // وقت الانتظار

    Get.offAllNamed(Routes.HOME); // المستخدم مسجل
  }

  @override
  void onReady() {
    super.onReady();
    _checkAuth();
  }
}
