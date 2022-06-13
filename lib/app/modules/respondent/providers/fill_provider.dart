import 'package:get/get.dart';

class FillProvider extends GetConnect {
  String url = 'http://127.0.0.1:8000/surveys/fill/';

  postSurvey(var token, var data) async {
    print(data);
    var response = await post(
      url,
      data,
      headers: {
        "Authorization": "Token $token",
      },
      contentType: "application/json",
    );
   // print(response.body);

    if (response.status.connectionError){
      return "connectionError";
    }
    else if(response.status.hasError){

      return "hasError";
    }
    else {
      return "success";
    }
  }
}
