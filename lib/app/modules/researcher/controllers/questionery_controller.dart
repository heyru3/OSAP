import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestioneryController extends GetxController {
  GlobalKey<FormState> eachBoxKey = GlobalKey<FormState>();
  late TextEditingController bigTitleTextController;
  late TextEditingController bigDescriptionTextController;
  late TextEditingController budgetTextController;
  late TextEditingController numberOfRespondentTextController;
  late TextEditingController numberOfDayTextController;
  late TextEditingController eachBoxTextController;
  late TextEditingController eachBoxDescriptionController;

  RxInt questioneryAmount = 1.obs;
  RxDouble devHeight = 0.0.obs;
  RxBool bigBoxVisibility = false.obs;

  @override
  void onInit() {
    bigTitleTextController = TextEditingController();
    bigDescriptionTextController = TextEditingController();
    eachBoxTextController = TextEditingController();
    eachBoxDescriptionController = TextEditingController();
    budgetTextController = TextEditingController();
    numberOfRespondentTextController = TextEditingController();
    numberOfDayTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    bigTitleTextController.dispose();
    bigDescriptionTextController.dispose();
    eachBoxTextController.dispose();
    eachBoxDescriptionController.dispose();
    budgetTextController.dispose();
    numberOfRespondentTextController.dispose();
    numberOfDayTextController.dispose();
  }

  double containerHeight(BuildContext context) {
    devHeight.value += MediaQuery.of(context).size.height * 2.3 / 4;
    return devHeight.value;
  }
}
