import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osap/app/modules/login/controllers/login_controller.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> forgotPasswordForm = GlobalKey<FormState>();

  LoginController loginController = Get.put(LoginController());
}
