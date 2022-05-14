import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../providers/respondent_sign_up_provider.dart';

class RespondentSignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;
  RxString gender = 'N'.obs;
  RxString region = 'None'.obs;
  RxInt education = 1.obs;
  RxInt occupation = 1.obs;

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final DateTime initialDate = DateTime(DateTime.now().year - 120);
  Rx<DateTime> birthDate = DateTime(DateTime.now().year - 120).obs;
  final DateTime firstDate = DateTime(DateTime.now().year - 120);
  final DateTime lastDate = DateTime(DateTime.now().year - 10);
  var firstName = '';
  var lastName = '';
  var email = '';
  var username = '';
  var password = '';
  var conpassword = '';
  var city = '';
  var phone = '';

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailNameController;
  late TextEditingController passwordNameController;
  late TextEditingController conpasswordNameController;
  late TextEditingController usernameController;
  late TextEditingController cityController;
  late TextEditingController phoneController;

  @override
  void onInit() async {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailNameController = TextEditingController();
    passwordNameController = TextEditingController();
    conpasswordNameController = TextEditingController();

    usernameController = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordNameController.dispose();
    conpasswordNameController.dispose();

    usernameController.dispose();
    cityController.dispose();
    phoneController.dispose();

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
String? validateRePassword(String value) {
    if (value == passwordNameController.text) {
      return null;
    }
    return 'password not much';
  }
  String? validateName(String value, String type) {
    if (value.isEmpty || value.isNumericOnly) {
      return "Enter a valid $type";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (!value.isPhoneNumber) {
      return 'Enter a valid phone  number';
    }
    return null;
  }

  chooseDateRangePicer() async {
    DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDate: initialDate,
        initialDatePickerMode: DatePickerMode.year,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color.fromARGB(255, 114, 10, 114),
                ),
              ),
              child: child!);
        });

    if (picked != null && picked != birthDate.value) {
      return picked;
    }
    return birthDate.value;
  }

  signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String gender,
    String birthDate,
    String region,
    String city,
    String phoneNumber,
    int educationLevel,
    int occupatin,
    String password,
  ) async {
    dynamic response = await RespondentSignUpProvider().respondentSignup(
      username,
      firstName,
      lastName,
      email,
      gender,
      birthDate,
      region,
      city,
      phoneNumber,
      educationLevel,
      occupatin,
      password,
    );

    return response;
  }
}
