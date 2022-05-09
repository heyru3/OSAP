import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/modules/login/providers/login_provider.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  RxString userToke = ''.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be fo 6 character';
    }
    return null;
  }

  login(String password, String email) async {
    dynamic response = await LoginProvider().login(password, email);
    if (response['auth_token'] == 'error') {
      return false;
    } else {
      return true;
    }
  }
}
