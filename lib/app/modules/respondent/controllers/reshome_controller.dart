import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:osap/app/modules/respondent/providers/display_survey_provider.dart';
import 'package:osap/app/modules/respondent/providers/fill_provider.dart';

class ReshomeController extends GetxController {
  RxBool snackbar = false.obs;
  List<String> options = ["Getx", "provider", "Block", "Mobx"];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  var choiceList = [].obs;
  int questionId = 0;
  RxMap<String, dynamic> dropdown = <String, dynamic>{}.obs;
  Map<int, dynamic> selectedChoice = <int, dynamic>{};
  RxMap<int, String> choice = <int, String>{}.obs;
  var drop = ''.obs;
  var educationLevelValue = [].obs;
  List<String> items = ["Getx", "provider", "Block", "Mobx"];
  //var dropdownvalue=''.obs;
  RxMap<int, dynamic> dropdownvalue = <int, dynamic>{}.obs;
  RxInt dropdownChoiceId = 0.obs;
  var multipleChoiceId = 0;
  // RxString value = ''.obs;
  var shortAnswer = '';
  var longAnswer = '';
  int integer = 0;
  int decimal = 0;
  RxInt numberOfQuestionnairy = 0.obs;
  RxMap<int, int> numberOfQuestionInSection = <int, int>{}.obs;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final DateTime initialDate = DateTime.now();
  Rx<DateTime> birthDate = DateTime(DateTime.now().year - 3000).obs;
  final DateTime firstDate = DateTime(DateTime.now().year - 3000);
  final DateTime lastDate = DateTime(DateTime.now().year + 4000);
  Map<int, dynamic> selectedTime = <int, dynamic>{}.obs;
  Map<int, dynamic> selectedDate = <int, dynamic>{}.obs;
  var initialTime = TimeOfDay.now().obs;
  RxString errorhandler = "* required".obs;
  RxBool choiceRequired = false.obs;

  chooseTime(
    var id,
  ) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: initialTime.value,
        initialEntryMode: TimePickerEntryMode.input,
        helpText: "select time",
        cancelText: "close",
        confirmText: "Ok",
        errorInvalidText: "provide valid time",
        hourLabelText: "select Hour",
        minuteLabelText: "Select Minute");

    if (pickedTime != null) {
      selectedTime[id] = '${pickedTime.hour}:${pickedTime.minute}'.trim();
      onTimeUpdate(id, selectedTime[id]);
    }
  }

  chooseDateRangePicerforform(var id) async {
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

    if (picked != null) {
      selectedDate[id] = picked;
      onDateUpdate(id, selectedDate[id]);
    }
  }

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
    Future.delayed(
      Duration(microseconds: 2),
    ).then((value) => getSnackbar(snackbar.value));
  }

  @override
  void onClose() {
    shortAnswerController.dispose();
    longAnswerController.dispose();
    decimalController.dispose();
    integerController.dispose();
  }

  String? validateInteger(var min, var max, String value, bool required) {
    if (required == false) {
      if (GetUtils.isNumericOnly(value)) {
        if (max == null || min == null) {
          return null;
        } else {
          if (int.parse(value).isLowerThan(max) &&
              int.parse(value).isGreaterThan(min)) {
            return null;
          } else {
            return 'Enter value between $min and $max';
          }
        }
      } else if (!GetUtils.isNumericOnly(value) && value.isNotEmpty) {
        return "enter valid integer";
      }
      return null;
    } else {
      if (GetUtils.isNumericOnly(value)) {
        if (max == null || min == null) {
          return null;
        } else {
          if (int.parse(value).isLowerThan(max) &&
              int.parse(value).isGreaterThan(min)) {
            return null;
          } else {
            return 'Enter value between $min and $max';
          }
        }
      } else if (!GetUtils.isNumericOnly(value) && value.isNotEmpty) {
        return "enter valid integer";
      }
      return "the question must me filled";
    }
  }

  String? validatedDecimal(var min, var max, String value, bool required) {
    if (required == false) {
      ////////////////////////////////////////
      if (GetUtils.isNum(value)) {
        if (max == null || min == null) {
          return null;
        } else {
          if (num.parse(value).isLowerThan(max ?? num.parse(value) + 1) &&
              num.parse(value).isGreaterThan(min ?? num.parse(value) - 1)) {
            return null;
          } else {
            return 'Enter value between $min and $max';
          }
        }
      } else if (!GetUtils.isNum(value) && value.isNotEmpty) {
        return "enter valid Decimal";
      }

      return null;
    } ////////////////////////////////
    else {
      if (GetUtils.isNum(value)) {
        if (max == null || min == null) {
          return null;
        } else {
          if (num.parse(value).isLowerThan(max ?? num.parse(value) + 1) &&
              num.parse(value).isGreaterThan(min ?? num.parse(value) - 1)) {
            return null;
          } else {
            return 'Enter value between $min and $max';
          }
        }
      } else if (!GetUtils.isNum(value) && value.isNotEmpty) {
        return "enter valid Decimal";
      }
      return "the question must me filled";
    }
  }

//Validate the form
  validatedShortAnswer(String value, bool required) {
    if (required == false) {
      return null;
    } else {
      if (value.isEmpty) {
        return "the  question is required";
      } else {
        return null;
      }
    }
  }

  //Validate the form
  validatedLongAnswer(String value, bool required) {
    if (required == false) {
      return null;
    } else {
      if (value.isEmpty) {
        return "the  question is required";
      } else {
        return null;
      }
    }
  }

  // String? validateLongAnswer(String value) {
  //   if (value.length < 20) {
  //     return 'Password must be fo 20 character';
  //   }
  //   return null;
  // }

  // String? validateCheckBox(var max, int value, bool required) {
  //   if (max <= value ?? 0) {
  //     return 'chose at most $max';
  //   } else {
  //     return null;
  //   }
  // }

  getSurvey(token2) {
    var response = DisplaySurveyProvider().featchSurvey(token2);
    return response;
  }

  List<Map<int, dynamic>> timeCollection = <Map<int, dynamic>>[];
  List<Map<int, dynamic>> dateCollection = <Map<int, dynamic>>[];
  List<Map<int, dynamic>> shortAnswerCollection = <Map<int, dynamic>>[];
  List<Map<int, dynamic>> multipleChoicerCollection = <Map<int, dynamic>>[];
  List<Map<int, dynamic>> intigerAnswerCollection = <Map<int, dynamic>>[];
  List<Map<int, dynamic>> decimalAnswerCollection = <Map<int, dynamic>>[];
  Map<int, dynamic> choiceCollection = <int, dynamic>{};
  Map<int, dynamic> dropdownCollection = <int, dynamic>{};

  List<RxMap<int, Map<int, int>>> questionnairyCollection =
      <RxMap<int, Map<int, int>>>[].obs;
  onTimeUpdate(int id, var value) {
    int oldId = -1;

    for (var map in timeCollection) {
      if (map.containsKey(id)) {
        oldId = id;
        break;
      }
    }
    if (-1 != oldId) {
      timeCollection.removeWhere((element) {
        return element.containsKey(id);
      });
    }

    timeCollection.add({id: value});
    print(timeCollection);
  }

  onDateUpdate(int id, var value) {
    int oldId = -1;

    for (var map in dateCollection) {
      if (map.containsKey(id)) {
        oldId = id;
        break;
      }
    }
    if (-1 != oldId) {
      dateCollection.removeWhere((element) {
        return element.containsKey(id);
      });
    }

    dateCollection.add({id: dateFormat.format(value)});
    print(dateCollection);
  }

  postFill(var token, var data) async {
    var response = await FillProvider().postSurvey(token, data);
    return response;
  }

  getSnackbar(bool value) {
    if (value == true) {
      return Get.snackbar("success", "successfully created",
          backgroundColor: Colors.green);
    } else {
      return Get.snackbar("welcome", "welcome to OSAP",
          backgroundColor: Colors.red);
    }
  }
}
