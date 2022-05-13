import 'package:get/get.dart';

class LogoutProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/token/logout/';

  feachLogout(token) async {
    dynamic response = post(url, {}, headers: {
      'Authorization': 'Token $token',
    });

    if (response.statusCode == 401) {
      return false;
    }
    return true;
  }
}
