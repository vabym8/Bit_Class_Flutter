import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz/app/core/utils/helpers.dart';
import 'package:quiz/app/global_widget/question_text.dart';
import 'package:quiz/app/modules/question_multi/local_widget/multi_button.dart';

import '../controllers/question_multi_controller.dart';

class QuestionMultiView extends GetView<QuestionMultiController> {
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          controller.getChoices().length,
                          (index) {
                            return MultiButton(
                              text: '${controller.getChoices()[index]}',
                              color: Colors.blue,
                              onTap: () {
                                controller.checkAnswer(
                                    controller.getChoices()[index]);
                              },
                            );
                          },
                        ),
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
