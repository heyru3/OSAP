import 'package:get/get.dart';

import 'package:osap/app/modules/researcher/controllers/feedback_controller.dart';
import 'package:osap/app/modules/researcher/controllers/profile_controller.dart';
import 'package:osap/app/modules/researcher/controllers/questionery_controller.dart';
import 'package:osap/app/modules/researcher/controllers/result_controller.dart';

import '../controllers/researcher_controller.dart';

class ResearcherBinding extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<ResultController>(
      () => ResultController(),
    );
    Get.lazyPut<QuestioneryController>(
      () => QuestioneryController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<FeedbackController>(
      () => FeedbackController(),
    );
    Get.lazyPut<ResearcherController>(
      () => ResearcherController(),
    );
  }
}
