import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/providers/logout_provider.dart';

class ProfileController extends GetxController {
  var token = ''.obs;
  logout() async {
    bool response = await LogoutProvider1().feachLogout(token);
    return response;
  }
}
