import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../providers/researcher_sign_up_provider.dart';

class ResearcherSignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;
  RxMap<String, String> formInputList = <String,String>{}.obs ;

  var firstName = '';
  var lastName = '';
  var email = '';
  var username = '';
  var password = '';

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailNameController;
  late TextEditingController passwordNameController;
  late TextEditingController usernameController;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailNameController = TextEditingController();
    passwordNameController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordNameController.dispose();
    usernameController.dispose();
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

  String? validateName(String value, String type) {
    if (value.isEmpty || value.isNumericOnly) {
      return "Enter a valid $type";
    }
    return null;
  }

  signUp(String firstName,String lastName,String username,String email,String password) async {
    dynamic response = 
    await ResearcherSignUpProvider().researcherSignup(
      firstName,lastName,username,email,password);
    
    return response;
  }
}
