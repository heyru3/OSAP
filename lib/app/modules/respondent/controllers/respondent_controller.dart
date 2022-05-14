import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/providers/respondent_provider.dart';

import '../../researcher/providers/logout_provider.dart';

class RespondentController extends GetxController {
  final count = 0.obs;
  RxInt currentIndex = 0.obs;
  var token = ''.obs;
  logout() async {
    bool response = await LogoutProvider().feachLogout(token);
    return response;
  }
}
