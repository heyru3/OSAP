import 'package:get/get.dart';

import 'package:osap/app/modules/respondent/controllers/detail_display_question_controller.dart';
import 'package:osap/app/modules/respondent/controllers/profile_controller.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';
import 'package:osap/app/modules/respondent/controllers/respondent_feedback_controller.dart';
import 'package:osap/app/modules/respondent/controllers/respondent_notification_controller.dart';
import 'package:osap/app/modules/respondent/controllers/respondent_wallet_controller.dart';

import '../controllers/respondent_controller.dart';

class RespondentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDisplayQuestionController>(
      () => DetailDisplayQuestionController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<RespondentWalletController>(
      () => RespondentWalletController(),
    );
    Get.lazyPut<RespondentNotificationController>(
      () => RespondentNotificationController(),
    );
    Get.lazyPut<RespondentFeedbackController>(
      () => RespondentFeedbackController(),
    );
    Get.lazyPut<ReshomeController>(
      () => ReshomeController(),
    );

    Get.lazyPut<RespondentController>(
      () => RespondentController(),
    );
  }
}
