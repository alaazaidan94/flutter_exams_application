import 'dart:convert';
import 'package:project_test/Manger/MangerExams.dart';
import 'package:project_test/Manger/HomeManagement.dart';
import 'package:project_test/Student/HomeUser.dart';
import 'package:project_test/Student/ResultPage.dart';
import 'package:project_test/moduls/exams.dart';
import 'package:project_test/moduls/result.dart';
import 'package:project_test/moduls/resultManger.dart';
import 'package:project_test/moduls/review.dart';
import 'package:project_test/moduls/users.dart';
import 'package:project_test/moduls/ProjectFunctions.dart';
import 'package:flutter/material.dart';
import 'package:project_test/moduls/Questions.dart';
import 'package:http/http.dart' as http;
import 'package:project_test/Student/UserPage.dart';
import '../Manger/UsersManger.dart';
import '../Student/UserExams.dart';

class SMProvider with ChangeNotifier {

// Load All Question from Database
  List<questions> lst_all_ques = [];
  loadQuestions(examId) async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/questions", {
      "examId": "$examId",
    }));
    //print(request.body.toString());
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lst_all_ques = lstd.map((s) => questions.fromJson(s)).toList();
    notifyListeners();
  }

  List<exams> lst_all_exams = [];
  loadExams() async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/exams"));
    //print(request.body.toString());
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lst_all_exams = lstd.map((s) => exams.fromJson(s)).toList();
    getNumberFromExamEnable();
    notifyListeners();
  }

  var quesNumber;
  getNumberFromExamEnable(){
    for (var value in lst_all_exams) {
      if(value.state == "enable"){
        quesNumber = value.quesNumberForStud;
      }
    }
    notifyListeners();
  }

// Load All Users from Database
  List<users> lst_all_users = [];
  loadUsers() async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/users"));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lst_all_users = lstd.map((s) => users.fromJson(s)).toList();

    notifyListeners();
  }

  List<result> lst_user_result = [];
  loadResult(username) async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/result", {
      "username": "$username",
    }));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lst_user_result = lstd.map((s) => result.fromJson(s)).toList();
    notifyListeners();
  }

  List<resultManger> lst_result_Manger = [];
  List<resultManger> lst_result_Manger1 = [];
  loadResultManger() async {
    lst_result_Manger = [];
    lst_result_Manger1 = [];
    List lst = [];
    for (var value in lst_all_users) {
      lst.add(value.id);
    }
    for(var i=0;i<lst.length;i++){
      var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}","/resultManger", {
        "id":"${lst[i]}",
      }));
      List<dynamic> lstd = jsonDecode(request.body.toString());
      lst_result_Manger = lstd.map((s) => resultManger.fromJson(s)).toList();
      print("loop1");
      for(var y=0;y<lst_result_Manger.length;y++){
        lst_result_Manger1.add(lst_result_Manger[y]);
      }
    }
    notifyListeners();
  }

  List<review> lst_user_review = [];
  loadReview(username, examName) async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/review", {
      "username": "$username",
      "examName": "$examName",
    }));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lst_user_review = lstd.map((s) => review.fromJson(s)).toList();
    notifyListeners();
  }

// BottomBar Page Index
  var indexmanger = 0;
  dynamic widmanger = HomeManagement();
  getCurrentIndexManger(currentIndex) {
    indexmanger = currentIndex;
    if (indexmanger == 0) {
      widmanger = UsersManger();
    } else if (indexmanger == 1) {
    } else if (indexmanger == 2) {
      widmanger = MangerExam();
    } else if (indexmanger == 3) {}
    notifyListeners();
  }

// BottomBar Page Index
  var indexuser = 0;
  dynamic widuser = HomeUser();
  getCurrentIndexUser(currentIndex) {
    indexuser = currentIndex;
    if (indexuser == 0) {
      widuser = UserExamsPage();
    } else if (indexuser == 1) {
      widuser = ResultPage();
    }
    notifyListeners();
  }

// Password View
  var stateObscure = true;
  changeObscureText() {
    stateObscure = !stateObscure;
    notifyListeners();
  }

// Check Api
  checkApi(conn) async {
    try {
      var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/"));
    } catch (e) {
      showDialog(
          barrierDismissible: false,
          context: conn,
          builder: (context) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              content: Text("API Not requested"),
            );
          });
    }
  }


// DropDown List Or Change Value
  final List<String> listDrop = <String>['user', 'admin'];
  String? dropvalue;
  changeDropValue(newValue) {
    dropvalue = newValue;
    notifyListeners();
  }

  final List<String> listExamState = <String>['disable', 'enable'];
  String? dropvalueState;
  changeDropValueState(newValue) {
    dropvalueState = newValue;
    notifyListeners();
  }

  final List<String> listStateAnswer = <String>['true', 'false'];
  String? dropStateAnswer;
  changeDropStateAnswer(newValue) {
    dropStateAnswer = newValue;
    notifyListeners();
  }

// Return Random Questions from list Questions
  List<String> lstGroup = [];
  List lstId = [];
  List<questions> randomItems = [];
  RandomQuestion() {
    randomItems=[];
    lstGroup=[];
    lstId=[];
    Set<questions> itemSet = lst_all_ques.toSet();
    List<questions> lstI = itemSet.toList();
    lstI.shuffle();
    for (var i = 0; i < quesNumber; i++) {
      randomItems.add(lstI[i]);
      lstGroup.add("null");
    }
    randomItems.forEach((e) {
      lstId.add(e.id);
    });
    notifyListeners();
  }

// Change Index of list Random Question Show to user
  //var ind = 0;
  var QuestionContext;
  var ExamNameFromFunctionGetPassword;
  changeNextIndex() {
    if (questionIndex < randomItems.length - 1) {
      questionIndex++;
      QuestionIndex();
    }
    if (questionIndex > 0 && questionIndex < randomItems.length - 1) {
      Button2 = ElevatedButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red.shade200),
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue.shade100),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ))),
          onPressed: () {
            changePrevIndex();
            //Provider.of<SMProvider>(context,listen: false).QuestionIndex();
          },
          child: Text("Prev"));
    } else if (questionIndex == randomItems.length - 1) {
      Button1 = ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade100),
          ),
          onPressed: () {
            showDialog(
                context: QuestionContext,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Finish Quiz"),
                    content: Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: [
                            Icon(Icons.warning_amber),
                          ],),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              children: [
                                Text("Are you sure"),
                              ],
                            ),
                            Row(children: [Text("you want to Finish Quiz")],)
                          ],),
                        ],
                      ),
                    ),
                    actions: [
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                              onPressed: () {
                                postAnswer(lstGroup, lstId, idUser, ExamId);
                                Navigator.of(QuestionContext).pushReplacement(MaterialPageRoute(builder: (_){
                                  return UserPage();
                                }));
                              },
                              child:
                                  Container(width: 80, child: Text("Finish"))),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.teal),
                              ),
                              onPressed: () {
                                Navigator.of(QuestionContext).pop();
                              },
                              child:
                                  Container(width: 80, child: Text("Cancel"))),
                        ],
                      )
                    ],
                  );
                });
          },
          child: Text("Finish Quiz"));
    }
    notifyListeners();
  }

  changePrevIndex() {
    if (questionIndex > 0) {
      questionIndex--;
      QuestionIndex();
    }
    if (questionIndex == 0) {
      Button2 = Container();
    }
    notifyListeners();
  }

  var appBarText = "";
  changeAppBarText(newText) {
    appBarText = newText;
    notifyListeners();
  }

  dynamic Button1;
  dynamic Button2 = Container();
  dynamic wid2 = Container();
  var x = Colors.teal.shade500;
  var questionIndex = 0;
  QuestionIndex() {
    var z = randomItems.elementAt(questionIndex);
    wid2 = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(
          width: 3,
          color: Colors.green,
        ),
      ),
      width: double.infinity,
      height: 450,
      //color: x,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15),
                    topEnd: Radius.circular(15),
                  ),
                  //border: Border(bottom: BorderSide(width: 1,color: Colors.black)),
                  color: Colors.green,
                ),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  "${z.question}",
                  style: TextStyle(fontSize: 20),
                )),flex: 3,
          ),
          Expanded(child: Column(
            children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade300,
                    ),
                    child: Center(
                      child: RadioListTile(
                        activeColor: Colors.red,
                        title: Text("${z.choice1}"),
                        value: "${z.choice1}",
                        groupValue: lstGroup[questionIndex],
                        onChanged: (v) {
                          lstGroup[questionIndex] = v.toString();
                          QuestionIndex();
                          print(lstGroup[questionIndex]);
                        },
                      ),
                    )),
              ),flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade300,
                    ),
                    child: Center(
                      child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text("${z.choice2}"),
                          value: "${z.choice2}",
                          groupValue: lstGroup[questionIndex],
                          onChanged: (v) {
                            lstGroup[questionIndex] = v.toString();
                            QuestionIndex();
                            print(lstGroup[questionIndex]);
                          }),
                    )),
              ),flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade300,
                    ),
                    child: Center(
                      child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text("${z.choice3}"),
                          value: "${z.choice3}",
                          groupValue: lstGroup[questionIndex],
                          onChanged: (v) {
                            lstGroup[questionIndex] = v.toString();
                            QuestionIndex();
                            print(lstGroup[questionIndex]);
                          }),
                    )),
              ),flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade300,
                    ),
                    child: Center(
                      child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text("${z.choice4}"),
                          value: "${z.choice4}",
                          groupValue: lstGroup[questionIndex],
                          onChanged: (v) {
                            lstGroup[questionIndex] = v.toString();
                            QuestionIndex();
                            print(lstGroup[questionIndex]);
                          }),
                    )),
              ),flex: 1,
            ),
          ],),flex: 10,)

        ],
      ),
    );
    if (questionIndex > -1 && questionIndex < randomItems.length) {
      Button1 = ElevatedButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green.shade400),
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue.shade100),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ))),
          onPressed: () {
            changeNextIndex();
          },
          child: Text("Next"));
    }
    notifyListeners();
  }

  /*QuestionIndex() {
    var z = randomItems.elementAt(questionIndex);
    wid2 = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(
          width: 3,
          color: Colors.black,
        ),
        color: Colors.blue.shade200,
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      height: 312,
      //color: x,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
                //border: Border(bottom: BorderSide(width: 1,color: Colors.black)),
                color: Colors.green,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 75,
              child: Text(
                "${z.question}",
                style: TextStyle(fontSize: 20),
              )),
          Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20),topEnd: Radius.circular(20)),
                // border: Border(bottom: BorderSide(width: 1)),
                color: Colors.blue.shade200,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 55,
              child: RadioListTile(
                activeColor: Colors.red,
                title: Text("${z.choice1}"),
                value: "${z.choice1}",
                groupValue: lstGroup[questionIndex],
                onChanged: (v) {
                  lstGroup[questionIndex] = v.toString();
                  QuestionIndex();
                  print(lstGroup[questionIndex]);
                },
              )),
          Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20),topEnd: Radius.circular(20)),
                //border: Border(bottom: BorderSide(width: 1)),
                color: Colors.blue.shade200,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 55,
              child: RadioListTile(
                  activeColor: Colors.red,
                  title: Text("${z.choice2}"),
                  value: "${z.choice2}",
                  groupValue: lstGroup[questionIndex],
                  onChanged: (v) {
                    lstGroup[questionIndex] = v.toString();
                    QuestionIndex();
                    print(lstGroup[questionIndex]);
                  })),
          Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20),topEnd: Radius.circular(20)),
                // border: Border(bottom: BorderSide(width: 1)),
                color: Colors.blue.shade200,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 55,
              child: RadioListTile(
                  activeColor: Colors.red,
                  title: Text("${z.choice3}"),
                  value: "${z.choice3}",
                  groupValue: lstGroup[questionIndex],
                  onChanged: (v) {
                    lstGroup[questionIndex] = v.toString();
                    QuestionIndex();
                    print(lstGroup[questionIndex]);
                  })),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20)),
                //border: Border(bottom: BorderSide(width: 1)),
                color: Colors.blue.shade200,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 55,
              child: RadioListTile(
                  activeColor: Colors.red,
                  title: Text("${z.choice4}"),
                  value: "${z.choice4}",
                  groupValue: lstGroup[questionIndex],
                  onChanged: (v) {
                    lstGroup[questionIndex] = v.toString();
                    QuestionIndex();
                    print(lstGroup[questionIndex]);
                  })),
        ],
      ),
    );
    if (questionIndex > -1 && questionIndex < randomItems.length) {
      Button1 = ElevatedButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green.shade400),
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue.shade100),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ))),
          onPressed: () {
            changeNextIndex();
          },
          child: Text("Next"));
    }
    notifyListeners();
  }*/

  changeQuestionIndex(newIndex) {
    questionIndex = newIndex;
    QuestionIndex();
    notifyListeners();
  }

  var Contextt;
  dynamic ExamBottom = Text(
    "There are no exams at this time",
    style: TextStyle(fontSize: 30, color: Colors.deepPurple),
  );
  changeExamBottom(newName,conn) async {
    var ps = TextEditingController();
    var keExam = GlobalKey<FormState>();
    ExamBottom = ElevatedButton(
        onPressed: () {
          showDialog(
              context: Contextt,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(
                      255, 255, 255, 0.9),
                  title: Row(
                    children: [
                      Icon(Icons.security),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Enter PassWord Exam")
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          key: keExam,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      10),
                                  child:
                                  TextFormField(
                                    controller: ps,
                                    validator:
                                        (value) {
                                      if (value!
                                          .isEmpty) {
                                        return "Password Required";
                                      }
                                      return null;
                                    },
                                    decoration:
                                    InputDecoration(
                                      prefixIcon:
                                      Icon(Icons
                                          .password),
                                      border:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            20),
                                      ),
                                      labelText:
                                      'Password Exam',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty
                                  .all<Color>(
                                  Colors.blue),
                            ),
                            onPressed: () {
                              ProjectFunctions.getPasswordExam(newName, ps.text,appBarText,Contextt);
                              ps.text = "";
                            },
                            child: Container(
                                width: 80,
                                child:
                                Text("Enter"))),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty
                                  .all<Color>(
                                  Colors
                                      .teal),
                            ),
                            onPressed: () {
                              Navigator.of(Contextt).pop();
                            },
                            child: Container(
                                width: 80,
                                child:
                                Text("Cancel"))),
                      ],
                    )
                  ],
                );
              });
        },
        child: Container(
          child: Center(child: Text("$newName")),
          width: 300,
          height: 20,
        ));
    notifyListeners();
  }

  changeExamBottom2() {
    ExamBottom = Text(
      "There are no exams at this time",
      style: TextStyle(fontSize: 30, color: Colors.deepPurple),
    );
    notifyListeners();
  }

  var idUser = "";
  getUserNameId(username) async {
    var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}", "/getUserId", {
      "username": "$username",
    }));
    idUser = request.body.toString();
    notifyListeners();
  }

  var ExamId = 0;
  changeExamId(newId) {
    ExamId = newId;
    notifyListeners();
  }

  postAnswer(lss1, lss2, userId, examId) async {
    bool state = false;
    for (var i = 0; i < lss1.length; i++) {
      if (randomItems[i].correctAnswer == lstGroup[i]) {
        state = true;
      } else {
        state = false;
      }
      var request = await http.post(Uri.http("${ProjectFunctions.apiUrl}", "/userAnswer", {
        "answer": "${lss1[i]}",
        "questionId": "${lss2[i]}",
        "userId": "${userId}",
        "examId": "${examId}",
        "state": "${state}",
      }));
    }
    loadResult(appBarText);
  }

  dynamic userView = Center(child: Image.asset("images/logo.png"),);
  changeUserView(conn) {
    userView = SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            DataTable(
              columnSpacing: 10,
              horizontalMargin: 5,
                dataRowHeight: 120,
                headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                dataTextStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.green),
                columns: [
                  DataColumn(label: Text("Question")),
                  DataColumn(label: Text("CorrectAnswer")),
                  DataColumn(label: Text("StudentAnswer")),
                  DataColumn(label: Text("State")),
                ],
                rows: [
                  ...lst_user_review.map((e) {
                    var x = Colors.red;
                    var y = Icons.clear_outlined;
                    if(e.state == 'true'){
                      x = Colors.green;
                      y = Icons.check_circle_outline;
                    }
                    return DataRow(
                        cells: [
                          DataCell(Text("${e.question}")),
                          DataCell(Text("${e.correctanswer}")),
                          DataCell(Text("${e.answer}",style: TextStyle(color: Colors.purple),)),
                          DataCell(Icon(y,color: x,)),
                        ]);
                  }),
                ])
          ],
        ),
      ),
    );
    notifyListeners();
  }

  var fullNameUser = "";
  var charNameUser = "";
  changeFullName(newFullName){
    fullNameUser = newFullName;
    charNameUser = newFullName.toString().characters.first.toUpperCase();
    notifyListeners();
  }

}


