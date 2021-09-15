import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz/app/core/theme/text_theme.dart';
import 'package:quiz/app/data/enum/question_type.dart';
import 'package:quiz/app/data/model/topic.dart';

import '../controllers/topic_selection_controller.dart';

class TopicSelectionView extends GetView<TopicSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton<Topic>(
                          items: controller.dropTopics,
                          value: controller.selectedTopic.value,
                          onChanged: controller.onChangeTopics,
                          dropdownColor: Colors.white,
                          underline: Container(),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Optional',
                            style: defaultTextStyle,
                          ),
                          Radio<QuestionType>(
                              value: QuestionType.OPTIONAL,
                              groupValue: controller.qType.value,
                              onChanged: controller.onChangeQuestionType),
                          Text(
                            'Multi Choice',
                            style: defaultTextStyle,
                          ),
                          Radio<QuestionType>(
                              value: QuestionType.MULTICHOICE,
                              groupValue: controller.qType.value,
                              onChanged: controller.onChangeQuestionType),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      MaterialButton(
                        onPressed: () => controller.onQuizStart(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Start'.toUpperCase(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
