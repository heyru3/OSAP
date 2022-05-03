import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  late TextEditingController feedbackTextController;

  @override
  void onInit() {
    feedbackTextController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    feedbackTextController.dispose();
  }

  void submitFeedback(value) {
    //Todo:logic of submission
  }
}
