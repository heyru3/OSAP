import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  login(String password, String email) async {
    final response = await post('http://127.0.0.1:8000/auth/token/login/',
        {'password': password, 'email': email},
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
        });
    print(response.body);

    if (response.status.hasError) {
      return {'auth_token': 'error'};
    } else {
      return response.body;
    }
  }
}
