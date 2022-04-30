import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;

  var firstName = '';
  var lastName = '';
  var email = '';
  var phone = '';
  var password = '';

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailNameController;
  late TextEditingController passwordNameController;
  late TextEditingController phoneNameController;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailNameController = TextEditingController();
    passwordNameController = TextEditingController();
    phoneNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordNameController.dispose();
    phoneNameController.dispose();
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

  String? validatePhone(String value) {
    if (!value.isPhoneNumber) {
      return "Enter a valid phone number";
    }
    return null;
  }
}
