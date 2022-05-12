import 'package:get/get.dart';

class RespondentSignUpProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/requirements/education-levels/';

  dynamic getEducationLevel() async {
    dynamic response = await get(url);
    if (response.status.hasError) {
      return [
        {'level_name': 'none'}
      ];
    } else {
      return response.body;
    }
  }
}
