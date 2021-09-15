import 'package:get/get.dart';

import '../controllers/question_option_controller.dart';

class QuestionOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionOptionController>(
      () => QuestionOptionController(),
    );
  }
}
