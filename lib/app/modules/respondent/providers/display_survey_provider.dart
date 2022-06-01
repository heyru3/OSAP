import 'dart:convert';

import 'package:get/get.dart';

class DisplaySurveyProvider extends GetConnect {
  String url = "http://127.0.0.1:8000/surveys/";
  featchSurvey(token) async {
    dynamic response = await get(url, headers: {
      'Authorization': 'Token $token',
    });
    var jsonData = jsonDecode(response.bodyString!);
   // print(jsonData);
    return jsonData;
  }
}
