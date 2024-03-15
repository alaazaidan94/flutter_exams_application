class resultManger {
  int? id;
  String? username;
  String? fullName;
  String? examName;
  int? totalQuestion;
  int? tureAnswer;

  resultManger(
      {this.id,
        this.username,
        this.fullName,
        this.examName,
        this.totalQuestion,
        this.tureAnswer});

  resultManger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
    examName = json['examName'];
    totalQuestion = json['totalQuestion'];
    tureAnswer = json['tureAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['examName'] = this.examName;
    data['totalQuestion'] = this.totalQuestion;
    data['tureAnswer'] = this.tureAnswer;
    return data;
  }
}