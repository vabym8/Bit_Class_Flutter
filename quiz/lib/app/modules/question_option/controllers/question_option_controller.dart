import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/core/utils/helpers.dart';
import 'package:quiz/app/modules/topic_selection/controllers/topic_selection_controller.dart';

class QuestionOptionController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt _questionNumber = 0.obs;
  RxInt correctAnswerCount = 0.obs;
  RxList<Widget> scoreKeeper = <Widget>[].obs;

  String getQuestionText() {
    return Get.find<TopicSelectionController>()
        .optionalQuestions[_questionNumber.value]
        .question;
  }

  bool getCorrectAnswer() {
    return Get.find<TopicSelectionController>()
        .optionalQuestions[_questionNumber.value]
        .answer;
  }

  void nextQuestion() {
    if (_questionNumber.value <
        Get.find<TopicSelectionController>().optionalQuestions.length - 1) {
      _questionNumber.value++;
    }
  }

  bool isFinished() {
    if (_questionNumber.value >=
        Get.find<TopicSelectionController>().optionalQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber.value = 0;
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = getCorrectAnswer();
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      correctAnswerCount++;
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    if (isFinished()) {
      DialogHelper.showDialog(
        message:
            'Quiz Finished! \n Score: ${correctAnswerCount.value * 10} / 50',
        close: true,
        dismis: false,
      );
    } else {
      nextQuestion();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
