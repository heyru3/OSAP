import 'package:get/get.dart';

import 'package:osap/app/modules/sign_up/controllers/respondent_sign_up_controller.dart';

import '../controllers/researcher_sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RespondentSignUpController>(
      () => RespondentSignUpController(),
    );
    Get.lazyPut<ResearcherSignUpController>(
      () => ResearcherSignUpController(),
    );
  }
}
