import 'package:get/get.dart';
class LogoutProvider1 extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/token/logout/';
  feachLogout(token) async {
  await post(url, {}, headers: {
      'Authorization': 'Token $token',
    });
   
    return true;
  }
}