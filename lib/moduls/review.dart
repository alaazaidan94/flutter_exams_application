class review {
  int? id;
  String? question;
  String? correctanswer;
  String? answer;
  String? examName;
  String? state;

  review(
      {this.id,
        this.question,
        this.correctanswer,
        this.answer,
        this.examName,
        this.state});

  review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    correctanswer = json['correctanswer'];
    answer = json['answer'];
    examName = json['examName'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['correctanswer'] = this.correctanswer;
    data['answer'] = this.answer;
    data['examName'] = this.examName;
    data['state'] = this.state;
    return data;
  }
}