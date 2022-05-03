import 'package:get/get.dart';

import 'package:osap/app/modules/login/controllers/forgot_password_controller.dart';
import 'package:osap/app/modules/login/controllers/verification_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
      () => VerificationController(),
    );
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
