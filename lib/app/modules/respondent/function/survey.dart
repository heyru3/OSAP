import 'questionnairy.dart';

getSurvey(int surveyId,int sectionCounter) {
  List questionnairy = [];
  
  return {"survey_id": surveyId, "responses": getQuestionnairy(questionnairy,sectionCounter)};
}
