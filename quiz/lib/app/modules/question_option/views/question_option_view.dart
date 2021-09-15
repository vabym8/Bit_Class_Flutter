import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz/app/core/theme/text_theme.dart';
import 'package:quiz/app/core/utils/helpers.dart';
import 'package:quiz/app/global_widget/question_text.dart';
import 'package:quiz/app/modules/question_option/local_widget/option_button.dart';
import 'package:quiz/app/modules/topic_selection/controllers/topic_selection_controller.dart';

import '../controllers/question_option_controller.dart';

class QuestionOptionView extends GetView<QuestionOptionController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              DialogHelper.showDialog(
                message: 'You will lose all progress.',
                close: true,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      QuestionText(
                        flex: 5,
                        text: controller.getQuestionText(),
                      ),
                      OptionButton(
                        text: 'True',
                        color: Colors.green,
                        onTap: () {
                          controller.checkAnswer(true);
                        },
                      ),
                      OptionButton(
                        text: 'False',
                        color: Colors.red,
                        onTap: () {
                          controller.checkAnswer(false);
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.scoreKeeper,
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
