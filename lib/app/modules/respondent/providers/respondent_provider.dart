import 'package:get/get.dart';

class RespondentProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/users/me/';

  Future<Map<String, dynamic>> get_user() async {
    dynamic response = await get(url, headers: {
      "Authorization": "Token 64f081ae480069ebd73c318e1f952c813c1d743b"
    });
    print('Success');
    if (response.status.hasError) {
      return {"data": "error"};
    }
    return response.body;
  }
}
