import 'dart:convert';

List<Optional> optionalFromJson(String str) =>
    List<Optional>.from(json.decode(str).map((x) => Optional.fromJson(x)));

class Optional {
  final int topic_id;
  final String question;
  final bool answer;
  final bool enabled;

  Optional(this.topic_id, this.question, this.answer, this.enabled);

  Optional.fromJson(Map<String, dynamic> json)
      : topic_id = json['topic_id'],
        question = json['question'],
        answer = json['answer'],
        enabled = json['enabled'];
}
