import 'package:get/get.dart';

class UserInformationProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/users/me/';
  feachUserInformation(token) async {
    dynamic response =
        await get(url, headers: {'Authorization': 'Token $token'});

    return response.body;
  }
}
