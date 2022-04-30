import 'dart:async';

import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    Timer(Duration(milliseconds: 2000), () {});
    Timer(Duration(milliseconds: 10), () {
      isVisible.value = true;
    });
    super.onInit();
  }
}
