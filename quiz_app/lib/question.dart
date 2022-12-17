class Question {
  String category = "Any category";
  String type = "Any type";
  String level = "Any level";
  String question = "";
  String correctAnswer = "";
  List<String> incorrectAnswers = [];
  List<String> answers = [];

  Question.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    level = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = List<String>.from(json['incorrect_answers']);

    answers = incorrectAnswers;
    answers.add(correctAnswer);
    answers.shuffle();
  }
}
