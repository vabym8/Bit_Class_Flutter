import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz/app/core/utils/extension_string.dart';
import 'package:quiz/app/core/utils/helpers.dart';
import 'package:quiz/app/data/enum/question_type.dart';
import 'package:quiz/app/data/model/multi_choice.dart';
import 'package:quiz/app/data/model/optional.dart';
import 'package:quiz/app/data/model/topic.dart';
import 'package:quiz/app/routes/app_pages.dart';

class TopicSelectionController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Topic> selectedTopic;
  RxList<Topic> topics = <Topic>[].obs;
  RxList<DropdownMenuItem<Topic>> dropTopics = <DropdownMenuItem<Topic>>[].obs;

  Rx<QuestionType> qType = QuestionType.OPTIONAL.obs;

  RxList<Optional> optionalQuestions = <Optional>[].obs;
  RxList<MultiChoice> multiChoiceQuestions = <MultiChoice>[].obs;

  Future<void> readTopics() async {
    isLoading(true);
    final String response =
        await rootBundle.loadString('assets/json/topics.json');
    final resData = await topicsFromJson(response);
    if (resData.isNotEmpty) {
      resData.forEach((element) {
        if (element.enabled) topics.add(element);
      });
    }
    // lPrint('L: ${topics.length}');
    isLoading(false);
    if (topics.isNotEmpty) setTopics();
    // update();
  }

  setTopics() {
    // lPrint(topics.first);
    // lPrint(topics.first);
    selectedTopic = topics.first.obs;
    // if (selectedTopic != null) {
    //   lPrint('NOT NULL');
    // } else {
    //   lPrint(' NULL');
    // }
    // update();
    isLoading(true);
    dropTopics.value = [];
    topics.sort((a, b) => a.title.compareTo(b.title));
    topics.forEach((element) {
      if (element.enabled)
        dropTopics.add(
          DropdownMenuItem(
            value: element,
            child: Row(
              children: [
                Text(
                  element.title.capitalizeFirstofEach,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),
        );
    });
    isLoading(false);
    // update();
  }

  onChangeTopics(Topic selected) {
    selectedTopic.value = selected;
    // update();
  }

  onChangeQuestionType(QuestionType type) {
    qType.value = type;
  }

  onQuizStart() {
    switch (qType.value) {
      case QuestionType.OPTIONAL:
        readOptionalQuestions();
        break;
      case QuestionType.MULTICHOICE:
        readMultiChoice();
        break;
    }
  }

  readMultiChoice() async {
    isLoading(true);
    final String response =
        await rootBundle.loadString('assets/json/multi_choice.json');
    final resData = await multiChoiceFromJson(response);
    multiChoiceQuestions.clear();
    List<MultiChoice> tempMulti = [];
    resData.forEach((element) {
      if (element.topic_id == selectedTopic.value.id) tempMulti.add(element);
    });
    if (tempMulti.isNotEmpty && tempMulti.length > 4) {
      tempMulti.shuffle();
      for (var i = 0; i < 5; i++) {
        multiChoiceQuestions.add(tempMulti[i]);
      }
    }
    if (multiChoiceQuestions.isNotEmpty) {
      Get.toNamed(Routes.QUESTION_MULTI);
    } else {
      DialogHelper.showDialog(
        message: 'Currently no questions available on this topic.',
      );
    }
    isLoading(false);
  }

  readOptionalQuestions() async {
    isLoading(true);
    final String response =
        await rootBundle.loadString('assets/json/optional.json');
    final resData = await optionalFromJson(response);
    optionalQuestions.clear();
    List<Optional> tempOpt = [];
    resData.forEach((element) {
      if (element.topic_id == selectedTopic.value.id) tempOpt.add(element);
    });
    if (tempOpt.isNotEmpty && tempOpt.length > 4) {
      tempOpt.shuffle();
      for (var i = 0; i < 5; i++) {
        optionalQuestions.add(tempOpt[i]);
      }
    }
    if (optionalQuestions.isNotEmpty) {
      Get.toNamed(Routes.QUESTION_OPTION);
    } else {
      DialogHelper.showDialog(
        message: 'Currently no questions available on this topic.',
      );
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    // lPrint('Initializing topic controller...!');
    readTopics();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
