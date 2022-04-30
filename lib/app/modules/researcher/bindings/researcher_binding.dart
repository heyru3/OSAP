import 'package:get/get.dart';

import '../controllers/researcher_controller.dart';

class ResearcherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResearcherController>(
      () => ResearcherController(),
    );
  }
}
