// ignore_for_file: file_names

import 'package:get/get.dart';

class ResearcherSignUpProvider extends GetConnect {
  researcherSignup(String firstName,String lastName,String username,String email,String password) async {
  
    final response = await post(
        'http://127.0.0.1:8000/auth/users/',
        {
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
          'email': email,
          'password': password,
        },
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
        });
    
    if (response.statusCode==400) {
      return false;
    } else {
      return true;
    }
  }
}
