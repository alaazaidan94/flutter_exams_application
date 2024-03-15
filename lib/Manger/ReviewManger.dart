import 'package:flutter/material.dart';
import 'package:project_test/moduls/ProjectFunctions.dart';
import 'package:provider/provider.dart';

import '../moduls/SMPovider.dart';

class ReviewManger extends StatelessWidget {
  var fullName;
  var userId;
  var examName;
  var userName;
  ReviewManger(this.fullName,this.userId,this.examName,this.userName);
  var keNumber = GlobalKey<FormState>();
  var num = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [
        Text("Student Answer :"),
        SizedBox(width: 10,),
        Text("( $fullName )",style: TextStyle(color: Colors.teal.shade100),),
      ],),),
      body: Container(
        color: Colors.teal.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...Provider.of<SMProvider>(context)
                        .lst_user_review
                        .map((s) {
                      var x = Colors.red;
                      var y = Icons.clear_outlined;
                      if(s.state == 'true'){
                        x = Colors.green;
                        y = Icons.check_circle_outline;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.green.shade200,borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: TextButton(onPressed: (){
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                    Colors.teal.shade200,
                                                    title: Row(
                                                      children: [
                                                        Icon(Icons.details_outlined),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text("Question Details"),
                                                      ],
                                                    ),
                                                    content: Container(
                                                      height: 75,
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  "Question",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "CorrectAnswer",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  "${s.question}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.correctanswer}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),

                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }, child: Text("${s.id}",style: TextStyle(color: Colors.red,fontSize: 20,),)),)],),
                                      ],),)
                                  ],),flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text("${s.answer}",style: TextStyle(color: Colors.purple),)],),flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [IconButton(onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            backgroundColor:
                                            Color.fromRGBO(255, 255, 255, 0.9),
                                            title: Row(
                                              children: [
                                                Icon(Icons.person_add),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Change State Answer")
                                              ],
                                            ),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.all(10),
                                                          child: DropdownButtonFormField(
                                                            decoration: InputDecoration(
                                                              prefixIcon: Icon(Icons.manage_accounts),
                                                              labelText: "State",
                                                              border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    20),
                                                              ),
                                                            ),
                                                            items: Provider.of<
                                                                SMProvider>(context)
                                                                .listStateAnswer
                                                                .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                                    (String value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                            onChanged: (String? value) {
                                                              Provider.of<SMProvider>(
                                                                  context,
                                                                  listen: false).changeDropStateAnswer(value);

                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: 40,
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 10, 10, 0),
                                                      child: ElevatedButton(
                                                        child: Text('Update'),
                                                        onPressed: () {
                                                          ProjectFunctions.updateStateAnswerFromReviewManger(s.id, userId, Provider.of<SMProvider>(context,listen: false).dropStateAnswer,userName,examName, context);
                                                          //
                                                        },
                                                      )),
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  }, icon: Icon(y,color: x,))],),flex: 1,
                              ),

                            ],),
                        ),
                      );
                    })
                  ],
                ),
                flex: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
