class questions {
  int? id;
  String? question;
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;
  String? correctAnswer;
  int? examId;

  questions(
      {this.id,
        this.question,
        this.choice1,
        this.choice2,
        this.choice3,
        this.choice4,
        this.correctAnswer,
        this.examId});

  questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    choice1 = json['choice1'];
    choice2 = json['choice2'];
    choice3 = json['choice3'];
    choice4 = json['choice4'];
    correctAnswer = json['correctAnswer'];
    examId = json['examId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['choice1'] = this.choice1;
    data['choice2'] = this.choice2;
    data['choice3'] = this.choice3;
    data['choice4'] = this.choice4;
    data['correctAnswer'] = this.correctAnswer;
    data['examId'] = this.examId;
    return data;
  }
}