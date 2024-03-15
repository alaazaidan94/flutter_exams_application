import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';
import '../Login&Signup/MainBody.dart';
import '../Manger/ManagementPage.dart';
import '../Student/Questions.dart';
import '../Student/UserPage.dart';


class ProjectFunctions{
static var apiUrl = "743fe75425da71.lhr.life";
static logIn(username,password,conn) async {
  var request = await http.get(Uri.http("${ProjectFunctions.apiUrl}","/verification",{
    "username":"$username",
    "password":"$password",
  }));
  print(request.body.toString());
  if(request.body.toString() == "\"admin\""){
    Provider.of<SMProvider>(conn,listen: false).loadResultManger();
    Provider.of<SMProvider>(conn,listen: false).changeAppBarText(username);
    Navigator.of(conn).pushReplacement(MaterialPageRoute(builder: (_){
      return ManagementPage();
    }));
  }
  else if(request.body.toString() == "\"user\""){
    Provider.of<SMProvider>(conn,listen: false).changeAppBarText(username);
    Provider.of<SMProvider>(conn,listen: false).loadResult(username);
    Provider.of<SMProvider>(conn,listen: false).getUserNameId(username);
    Navigator.of(conn).pushReplacement(MaterialPageRoute(builder: (_){
      return UserPage();
    }));
   // Provider.of<SMProvider>(conn,listen: false).changeAppBarText(username);
  }
  else if(request.body.toString() == "0"){
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();

          });
          return AlertDialog(
            content: Text("UserName Or Password Incorrect"),
          );
        });
  }
  else{
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();

          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }

}
static signUp(username,password,firstname,lastname,email,conn) async{
  var alert = "";
  var request = await http.post(Uri.http("${ProjectFunctions.apiUrl}","/users/addUsers",{
    "userName":"$username",
    "passWord":"$password",
    "firstName":"$firstname",
    "lastName":"$lastname",
    "email":"$email",
    "roles":"user"
  }));

  if(request.body.toString() == "1"){
    Provider.of<SMProvider>(conn,listen: false).loadUsers();
    alert = "successfully registered";
    Navigator.of(conn).pushReplacement(MaterialPageRoute(builder: (_) {
      return MainBody();
    }));
  }
  else if(request.body.toString() == "0"){
    alert = "This user already exists";
  }
  else{
    alert = "Error In DataBase";
  }
  showDialog(
      barrierDismissible: false,
      context: conn,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Text("$alert"),
        );
      });



}

static addQuestion(question,choice1,choice2,choice3,choice4,correct,examId,conn) async {
  var alert = "";
  var request = await http.post(Uri.http("${ProjectFunctions.apiUrl}","/questions/addQuestion",{
    "question":"$question",
    "choice1":"$choice1",
    "choice2":"$choice2",
    "choice3":"$choice3",
    "choice4":"$choice4",
    "correctanswer":"$correct",
    "examId":"$examId"
  }));

  if(request.body.toString() == "1"){
    Provider.of<SMProvider>(conn,listen: false).loadQuestions(examId);
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    alert = "Added successfully";
  }
  else if(request.body.toString() == "0"){
    alert = "This Question already exists";
  }
  else{
    alert = "Error In DataBase";
  }
  showDialog(
      barrierDismissible: false,
      context: conn,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Text("$alert"),
        );
      });
}
static removeQuestion(idQues,idExam,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/questions/removeQuestions", {
    "id": "$idQues",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadQuestions(idExam);
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Deleted Successfully"),
          );
        });
  }
}
static updateQuestion(idQues,question,choice1,choice2,choice3,choice4,correct,idExam,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/questions/updateQuestion",{
    "id": "$idQues",
    "question": "$question",
    "choice1": "$choice1",
    "choice2": "$choice2",
    "choice3": "$choice3",
    "choice4": "$choice4",
    "correctanswer": "$correct",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadQuestions(idExam);
    Navigator.of(conn).pop();
    showDialog(
      barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Updated Successfully"),
          );
        });
  } else {
    showDialog(
      barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}
static buttonAddQuestion(id,conn){
  var ke3 = GlobalKey<FormState>();
  var qn = TextEditingController();
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var c3 = TextEditingController();
  var c4 = TextEditingController();
  var can = TextEditingController();

  showDialog(
      barrierDismissible: false,
      context: conn, builder: (_){
    return AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      title: Row(children: [
        Icon(Icons.question_mark),
        SizedBox(width: 10,),
        Text("Add Question")
      ],),
      content: SingleChildScrollView(
        child: Column(children: [
          Form(
            key: ke3,
            child: Container(child: Column(children: [
              Row(children: [
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: qn,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Question Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.question_mark_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Question',
                    ),
                  ),
                ),),
              ],),
              Row(children: [
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: c1,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Choice1 Required";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.check_box),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Choice 1',
                    ),
                  ),
                ),),
              ],),
              Row(children: [
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: c2,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Choice2 Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.check_box),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Choice 2',
                    ),
                  ),
                ),),
              ],),
              Row(children: [
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: c3,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Choice3 Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.check_box),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Choice 3',
                    ),
                  ),
                ),),
              ],),
              Row(children: [
                Flexible(child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: c4,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Choice4 Required";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.check_box),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Choice 4',
                    ),
                  ),
                ),),
              ],),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: can,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "CorrectAnswer Required";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.check_box),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Correct Answer',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],),),
          ),

        ],),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child:  Text('Add'),
                  onPressed: () {
                    if(ke3.currentState!.validate()){
                      ProjectFunctions.addQuestion(qn.text, c1.text, c2.text, c3.text, c4.text,can.text,id, conn);
                      Provider.of<SMProvider>(conn,listen: false).loadExams();
                    }
                  },
                )
            ),
            Container(
                height: 40,
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child:  Text('Cancel'),
                  onPressed: () {
                    Navigator.of(conn).pop();
                    }
                )
            ),
          ],)
      ],

    );
});
}

static addUser(username,password,firstname,lastname,email,roles,conn) async {
  var alert = "";
  var request = await http.post(Uri.http("${ProjectFunctions.apiUrl}","/users/addUsers",{
    "userName":"$username",
    "passWord":"$password",
    "firstName":"$firstname",
    "lastName":"$lastname",
    "email":"$email",
    "roles":"$roles"
  }));

  if(request.body.toString() == "1"){
    Provider.of<SMProvider>(conn,listen: false).loadUsers();
    Navigator.of(conn).pop();
    alert = "Added successfully";
  }
  else if(request.body.toString() == "0"){
    alert = "This user already exists";
  }
  else{
    alert = "Error In DataBase";
  }
  showDialog(
      barrierDismissible: false,
      context: conn,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Text("$alert"),
        );
      });

}
static removeUser(id,conn) async {
  var request = await http.post(Uri.http("${ProjectFunctions.apiUrl}","/users/delUser",{
    "id":"$id",
  }));
  if(request.body.toString() == "1"){
    Provider.of<SMProvider>(conn,listen: false).loadUsers();
    Navigator.of(conn).pop();
    showDialog(
      barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Deleted Successfully"),
          );
        });
  }
}
static updateUser(id,password,roles,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/users/updateUsers",{
    "id": "$id",
    "password": "$password",
    "roles": "$roles",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadUsers();
    Navigator.of(conn).pop();
    showDialog(
      barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Updated Successfully"),
          );
        });
  } else {
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}

static updateExam(id,examName,password,state,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/exams/updateExam",{
    "id": "$id",
    "examName": "$examName",
    "password": "$password",
    "state": "$state",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    showDialog(
      barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Updated Successfully"),
          );
        });
  } else {
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}
static addExam(examName,state,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/exams/addExam",{
    "examName": "$examName",
    "state": "$state",
  }));

  var request1 = await http
      .get(Uri.http("127.0.0.1:8000","/exams/getLastExamId"));
  var id = request1.body.toString();
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    buttonAddQuestion(id, conn);
  } else {
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}
static removeExam(id,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}", "/exams/removeExam", {
    "id": "$id",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Deleted Successfully"),
          );
        });
  }
}
static NumberforStud(id,quesNumberforStud,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/exams/updateNumberQuestion",{
    "id": "$id",
    "number": "$quesNumberforStud",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadExams();
    Navigator.of(conn).pop();
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Successfully"),
          );
        });
  } else {
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}

static getStataExam(id,conn) async {
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/exams/stateExam",{
    "id": "$id",
  }));
  if(request.body.toString() == "\"enable\""){
    ProjectFunctions.getNameExam(id, conn);
  }
  else{
    Provider.of<SMProvider>(conn,listen: false).changeExamBottom2();
  }

}

static getNameExam(id,conn) async {
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/exams/nameExam",{
    "id": "$id",
  }));
  Provider.of<SMProvider>(conn,listen: false).changeExamBottom(request.body.toString(),conn);
}

static getAnswer(lst) async {
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/answer",{
    "lst": "$lst",
  }));
  print(request.body.toString());
}

static getPasswordExam(examname,password,username,conn) async {
  var length = examname.toString().length;
  var examNameSub = examname.toString().substring(1,length-1);
  Provider.of<SMProvider>(conn,listen: false).ExamNameFromFunctionGetPassword = examNameSub;
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/getExamPassword",{
    "examname": "$examNameSub",
  }));
  
  if(request.body.toString() == "\"$password\""){
    print("ok");
    checkUserExam(examNameSub,username,conn);
  }
  else{
    showDialog(context: conn, builder: (_){
      return AlertDialog(
        title: Text("PassWord InCorrect"),
      );
    });
  }
}

static checkUserExam(examname,username,conn) async {
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/checkUserExam",{
    "examname": "$examname",
    "username": "$username",
  }));
  if(request.body.toString() == "1"){
    print("ok check");
    showDialog(context: conn, builder: (_){
      return AlertDialog(
        title: Text("Alert"),
        content: Container(
          height: 75,
          child: Column(children: [
            Text("لقد قمت بالدخول مسبقا الى هذا الاختبار"),
            Text("سوف يتم مسح النتيجة السابقة"),
          ],),
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
                    deleteUserAnswerData(examname, conn);
                  },
                  child: Container(
                      width: 80,
                      child:
                      Text("OK"))),
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
                    Navigator.of(conn).pop();
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
  }
  else if(request.body.toString() == "0"){
    Provider.of<SMProvider>(conn,listen: false).questionIndex = 0;
    Provider.of<SMProvider>(conn,listen: false).RandomQuestion();
    Provider.of<SMProvider>(conn,listen: false).QuestionIndex();
    Navigator.of(conn)
        .pushReplacement(MaterialPageRoute(builder: (_) {
      return Questions(examname);
    }));
  }

}

static deleteUserAnswerData(examname,conn) async {
  var request1 = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/getExamId", {
    "examname": "$examname",
  }));
  var ExamId = request1.body.toString();

  var request2 = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/deleteUserData",{
    "userId":"${Provider.of<SMProvider>(conn,listen: false).idUser}",
    "examId":"${ExamId}",
  }));
  if(request2.body.toString() == "1"){

    Provider.of<SMProvider>(conn,listen: false).questionIndex = 0;
    Provider.of<SMProvider>(conn,listen: false).RandomQuestion();
    Provider.of<SMProvider>(conn,listen: false).QuestionIndex();
    Navigator.of(conn)
        .pushReplacement(MaterialPageRoute(builder: (_) {
      return Questions(examname);
    }));
  }
}

static getFullNameUser(username,conn) async {
  var request = await http
      .get(Uri.http("${ProjectFunctions.apiUrl}","/fullName",{
    "username": "$username",
  }));
  var length = request.body.toString().length;
  var fullNameUser = request.body.toString().substring(1,length-1);
  Provider.of<SMProvider>(conn,listen: false).changeFullName(fullNameUser);
}

static updateStateAnswerFromReviewManger(qId,uId,state,username,examname,conn) async {
  var request = await http
      .post(Uri.http("${ProjectFunctions.apiUrl}","/updateStateAnswerFromReviewManger",{
    "qId": "$qId",
    "uId": "$uId",
    "state": "$state",
  }));
  if (request.body.toString() == "1") {
    Provider.of<SMProvider>(conn,listen: false).loadReview(username, examname);
    Provider.of<SMProvider>(conn,listen: false).loadResultManger();
    Navigator.of(conn).pop();
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Updated Successfully"),
          );
        });
  } else {
    showDialog(
        barrierDismissible: false,
        context: conn,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("ERROR"),
          );
        });
  }
}
}
