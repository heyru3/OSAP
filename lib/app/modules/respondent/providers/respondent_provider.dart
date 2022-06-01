import 'package:get/get.dart';

class RespondentProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/users/me/';

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> get_user(token) async {
    dynamic response = await get(url, headers: {
      "Authorization": "Token $token"
    });
    print('Success');
    if (response.status.hasError) {
      return {"data": "error"};
    }
    return response.body;
  }
}
