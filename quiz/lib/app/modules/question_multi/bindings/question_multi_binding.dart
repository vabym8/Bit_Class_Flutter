import 'package:get/get.dart';

import '../controllers/question_multi_controller.dart';

class QuestionMultiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionMultiController>(
      () => QuestionMultiController(),
    );
  }
}
