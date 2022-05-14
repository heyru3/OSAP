import 'package:get/get.dart';


import '../../researcher/providers/logout_provider.dart';

class ProfileController extends GetxController {
  var token = ''.obs;
  logout() async {
    bool response = await LogoutProvider().feachLogout(token);
    return response;
  }
}
