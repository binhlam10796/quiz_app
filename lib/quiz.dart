class Quiz {
  late int responseCode;
  late List<Results> results;

  Quiz({
    required this.responseCode,
    required this.results,
  });

  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = responseCode;
    data['results'] = results.map((v) => v.toJson()).toList();
      return data;
  }
}

class Results {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? allAnswers;

  Results({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
  }) : allAnswers = [];

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    allAnswers = json['incorrect_answers'].cast<String>();
    allAnswers?.add(correctAnswer ?? '');
    allAnswers?.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.allAnswers;
    return data;
  }
}
