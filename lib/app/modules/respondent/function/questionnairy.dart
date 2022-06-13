import 'package:get/get.dart';
import 'package:osap/app/modules/respondent/controllers/reshome_controller.dart';

import '../views/detail_display_question_view.dart';

ReshomeController controller = Get.put(ReshomeController());
getQuestionnairy(List questionnairy, int sectionCount) {
  // ignore: unused_local_variable, prefer_typing_uninitialized_variables
  late var a;
  if (questionnairy.isNotEmpty) {
    questionnairy.clear();
  }
  // for (int index = 0; index < controller.numberOfQuestionnairy.value; index++) {
  for (int sCount = 0; sCount < sectionCount; sCount++) {
    for (int qCount = 0;
        qCount < controller.numberOfQuestionInSection[sCount + 1]!;
        qCount++) {
      var a = controller.questionnairyCollection.map((map) => map);
      for (var map in a) {
        if (map.containsKey(sCount + 1) &&
            map[sCount + 1]!.containsKey(qCount + 1)) {
          var type =
              DetailDisplayQuestionView().getQuestionniryType(sCount, qCount);
          if (type == 'Paragraph' || type == 'Short answer') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":[],
              "response_text":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          } else if (type == 'Time') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":[],
              "response_time":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          } else if (type == 'Date') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":[],
              "response_date":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          } else if (type == 'Decimal') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":[],
              "response_decimal":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          } else if (type == 'Integer') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":[],
              "response_integer":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          } else if (type == 'Drop down' || type == 'Multiple choice') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice": [
                createTypeAnswer(type, map[sCount + 1]![qCount + 1]!)
              ],
            });
          } else if (type == 'Check box') {
            questionnairy.add({
              "questionnaire_id": map[sCount + 1]![qCount + 1],
              "response_choice":
                  createTypeAnswer(type, map[sCount + 1]![qCount + 1]!),
            });
          }
        }
      }
    }
  }

  return questionnairy;
}

createTypeAnswer(String type, int questionId) {
  switch (type) {
    case 'Paragraph':
      var a = controller.shortAnswerCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;
    case 'Short answer':
      var a = controller.shortAnswerCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;

    case 'Time':
      var a = controller.timeCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;
    case 'Date':
      var a = controller.dateCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;
    case 'Decimal':
      var a = controller.decimalAnswerCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;
    case 'Integer':
      var a = controller.intigerAnswerCollection.map((map) => map);

      for (var x in a) {
        if (x.containsKey(questionId)) {
          return x[questionId];
        }
      }
      return null;
    case 'Check box':
      return controller.selectedChoice[questionId];
    case 'Drop down':
      return controller.dropdownCollection[questionId];
    case 'Multiple choice':
      return controller.choiceCollection[questionId];
    default:
      return null;
  }
}
