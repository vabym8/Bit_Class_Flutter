import 'dart:convert';

List<MultiChoice> multiChoiceFromJson(String str) => List<MultiChoice>.from(
    json.decode(str).map((x) => MultiChoice.fromJson(x)));

class MultiChoice {
  final int topic_id;
  final String question;
  final List<String> choices;
  final String answer;
  final bool enabled;

  MultiChoice(
      this.topic_id, this.question, this.choices, this.answer, this.enabled);

  MultiChoice.fromJson(Map<String, dynamic> json)
      : topic_id = json['topic_id'],
        question = json['question'],
        // choices = json['choices'],
        choices = List<String>.from(json['choices'].map((x) => x)),
        answer = json['answer'],
        enabled = json['enabled'];

  //choices: json["choices"] == null ? null : List<String>.from(json["choices"].map((x) => x)),

}
