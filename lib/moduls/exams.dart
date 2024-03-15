class exams {
  int? id;
  String? examName;
  String? state;
  String? password;
  int? quesNumberForStud;
  int? quesNumber;

  exams(
      {this.id,
        this.examName,
        this.state,
        this.password,
        this.quesNumberForStud,
        this.quesNumber});

  exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examName = json['examName'];
    state = json['state'];
    password = json['password'];
    quesNumberForStud = json['quesNumberForStud'];
    quesNumber = json['quesNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['examName'] = this.examName;
    data['state'] = this.state;
    data['password'] = this.password;
    data['quesNumberForStud'] = this.quesNumberForStud;
    data['quesNumber'] = this.quesNumber;
    return data;
  }
}