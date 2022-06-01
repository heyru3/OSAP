import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/providers/logout_provider.dart';

class RespondentController extends GetxController {
  final count = 0.obs;
  RxInt currentIndex = 0.obs;
  var token = ''.obs;
  logout() async {
    bool response = await LogoutProvider1().feachLogout(token);
    return response;
  }
}
