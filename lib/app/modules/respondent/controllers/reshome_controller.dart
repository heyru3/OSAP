import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/providers/respondent_provider.dart';

class ReshomeController extends GetxController {
  RxString email = ''.obs;
  RxString username = ''.obs;

  RxString firstname = ''.obs;

  RxString lastname = ''.obs;
  RxString roll = ''.obs;

  Future<Map<String, dynamic>> get_user_from() {
    var response = RespondentProvider().get_user();
    return response;
  }
}
