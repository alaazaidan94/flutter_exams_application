class result {
  String? examName;
  String? username;
  int? totalQuestion;
  int? tureAnswer;
  int? falseAnswer;

  result(
      {this.examName,
        this.username,
        this.totalQuestion,
        this.tureAnswer,
        this.falseAnswer});

  result.fromJson(Map<String, dynamic> json) {
    examName = json['examName'];
    username = json['username'];
    totalQuestion = json['totalQuestion'];
    tureAnswer = json['tureAnswer'];
    falseAnswer = json['falseAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examName'] = this.examName;
    data['username'] = this.username;
    data['totalQuestion'] = this.totalQuestion;
    data['tureAnswer'] = this.tureAnswer;
    data['falseAnswer'] = this.falseAnswer;
    return data;
  }
}