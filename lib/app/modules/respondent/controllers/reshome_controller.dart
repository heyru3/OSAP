import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:osap/app/modules/respondent/providers/display_survey_provider.dart';

class ReshomeController extends GetxController {
  Rx<List<String>> selectedoptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  RxString value = ''.obs;
  var shortAnswer = '';
  var longAnswer = '';
  int integer = 0;
  int decimal = 0;

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final DateTime initialDate = DateTime.now();
  Rx<DateTime> birthDate = DateTime(DateTime.now().year - 120).obs;
  final DateTime firstDate = DateTime(DateTime.now().year - 120);
  final DateTime lastDate = DateTime(DateTime.now().year + 10);
  var selectedTime = TimeOfDay.now().obs;

  
  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!, initialTime: selectedTime.value, initialEntryMode: TimePickerEntryMode.input
        helpText: "select time",
        cancelText: "close",confirmText: "Ok",errorInvalidText: "provide valid time",
        hourLabelText: "select Hour",minuteLabelText: "Select Minute"
        );
        
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
   
  }

  chooseDateRangePicerforform() async {
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

  final GlobalKey<FormState> shortandlong = GlobalKey<FormState>();
  final GlobalKey<FormState> decimalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> integerKey = GlobalKey<FormState>();

  late TextEditingController shortAnswerController,
      longAnswerController,
      integerController,
      decimalController;
  @override
  void onInit() {
    super.onInit();
    shortAnswerController = TextEditingController();
    longAnswerController = TextEditingController();
    integerController = TextEditingController();
    decimalController = TextEditingController();
  }

  @override
  void onClose() {
    shortAnswerController.dispose();
    longAnswerController.dispose();
    decimalController.dispose();
    integerController.dispose();
  }

  String? validateInteger(String value) {
    if (GetUtils.isNumericOnly(value)) {
      return null;
    }
    return "Provide valid enter integer";
  }

  String? validatedDecimal(String value) {
    if (GetUtils.isNum(value)) {
      return null;
    }
    return "Provide valid   decimal  number";
  }

  String? validateShortAnswer(String value) {
    if (GetUtils.isAlphabetOnly(value)) {
      return null;
    }
    return "Provide valid enter alphabet";
  }

  String? validateLongAnswer(String value) {
    if (value.length < 20) {
      return 'Password must be fo 20 character';
    }
    return null;
  }
  // RxString email = ''.obs;
  // RxString username = ''.obs;

  // RxString firstname = ''.obs;

  // RxString lastname = ''.obs;
  // RxString roll = ''.obs;
  // var token = ''.obs;
  // // ignore: non_constant_identifier_names
  // Future<Map<String, dynamic>> get_user_from() {
  //   var response = RespondentProvider().get_user(token);
  //   return response;
  // }

  getSurvey(token2) {
    var response = DisplaySurveyProvider().featchSurvey(token2);
    return response;
  }
}
