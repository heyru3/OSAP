import 'package:get/get.dart';

class RespondentSignUpProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/auth/users/respondents/';

  respondentSignup(
    String username,
    String firstName,
    String lastName,
    String gender,
    String email,
    String birthDate,
    String region,
    String city,
    String phoneNumber,
    int educationLevel,
    int occupatin,
    String password,
  ) async {
    final response = await post(
        url,
        {
          'username': username,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'gender': gender,
          'birth_date': birthDate,
          'region': region,
          'city': city,
          'phone_number': phoneNumber,
          'education_level': educationLevel,
          'occupation': occupatin,
          'password': password,
        },
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
        });
    print(response.body);
    if (response.statusCode == 400) {
      print('faile');
      return false;
    } else {
      print(true);
      return true;
    }
  }
}
