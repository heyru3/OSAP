import 'package:get/get.dart';

import '../providers/logout_provider.dart';

class ResearcherController extends GetxController {
  var token = ''.obs;
  logout() async {
    bool response = await LogoutProvider().feachLogout(token);
    return response;
  }
  
}
