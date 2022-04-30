import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResearcherController extends GetxController {
  GlobalKey<FormState> eachBoxKey = GlobalKey<FormState>();

  late TextEditingController feedbackTextController;
  late TextEditingController bigTitleTextController;
  late TextEditingController bigDescriptionTextController;
  late TextEditingController eachBoxTextController;

  RxInt questioneryAmount = 1.obs;
  RxDouble devHeight = 0.0.obs;
  RxBool bigBoxVisibility = false.obs;
  @override
  void onInit() {
    feedbackTextController = TextEditingController();
    bigTitleTextController = TextEditingController();
    bigDescriptionTextController = TextEditingController();
    eachBoxTextController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    feedbackTextController.dispose();
    bigTitleTextController.dispose();
    bigDescriptionTextController.dispose();
    eachBoxTextController.dispose();
  }

  double containerHeight(BuildContext context) {
    devHeight.value += MediaQuery.of(context).size.height * 2.3 / 4;
    return devHeight.value;
  }

  void submitFeedback(value) {
    //Todo:logic of submission
  }
}
