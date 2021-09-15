import 'package:get/get.dart';

import 'package:quiz/app/modules/question_multi/bindings/question_multi_binding.dart';
import 'package:quiz/app/modules/question_multi/views/question_multi_view.dart';
import 'package:quiz/app/modules/question_option/bindings/question_option_binding.dart';
import 'package:quiz/app/modules/question_option/views/question_option_view.dart';
import 'package:quiz/app/modules/topic_selection/bindings/topic_selection_binding.dart';
import 'package:quiz/app/modules/topic_selection/views/topic_selection_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TOPIC_SELECTION;

  static final routes = [
    GetPage(
      name: _Paths.TOPIC_SELECTION,
      page: () => TopicSelectionView(),
      binding: TopicSelectionBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_OPTION,
      page: () => QuestionOptionView(),
      binding: QuestionOptionBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_MULTI,
      page: () => QuestionMultiView(),
      binding: QuestionMultiBinding(),
    ),
  ];
}
