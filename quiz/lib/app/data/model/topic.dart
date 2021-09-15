import 'dart:convert';

import 'package:quiz/app/core/utils/helpers.dart';

List<Topic> topicsFromJson(String str) =>
    List<Topic>.from(json.decode(str).map((x) => Topic.fromJson(x)));

class Topic {
  final int id;
  final String title;
  final bool enabled;

  Topic(this.id, this.title, this.enabled);

  Topic.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        enabled = json['enabled'];
}
