import 'package:flutter/material.dart';
import 'package:project_test/moduls/ProjectFunctions.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

class QuestionsActions extends StatelessWidget {
  QuestionsActions(this.id,this.examName);
  var id;
  var examName;
  var c = false;
  late BuildContext _context;
  String? gender;
  var c11="";
  var c22="";
  var c33="";

  var ke3 = GlobalKey<FormState>();
  var qn = TextEditingController();
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var c3 = TextEditingController();
  var c4 = TextEditingController();
  var can = TextEditingController();




  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(title: Row(children: [
        Text("Question Page : "),
        Text("$examName",style: TextStyle(color: Colors.purple),)
      ],),backgroundColor: Colors.teal.shade400),
      body: Container(
        color: Colors.teal.shade100,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,// width: double.infinity,
                        child: DataTable(
                          columnSpacing: 35,
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.blue),
                          dataRowHeight: 130,
                          headingTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue.shade100),
                          columns: [
                            DataColumn(
                              label: Text("Question"),
                            ),
                            DataColumn(
                              label: Text("CorrectAnswer"),
                            ),
                            DataColumn(
                              label: Text("Actions"),
                            ),
                          ],
                          rows: [
                            ...Provider.of<SMProvider>(context).lst_all_ques.map((s) {
                              return DataRow(
                                  cells: [
                               // DataCell(Container(decoration: BoxDecoration(color: Colors.green.shade500,border: Border.all(width: 1,color: Colors.black)),child: Text("${s.id}",style: TextStyle(color: Colors.white,fontSize: 20),),)),
                                DataCell(Text("${s.question}")),
                                DataCell(Text("${s.correctAnswer}")),
                                DataCell(Container(
                                  child: Row(
                                    children: [
                                      IconButton(constraints: BoxConstraints(),padding: EdgeInsetsDirectional.all(5),
                                          onPressed: () {
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
                                                      height: 150,
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "Id",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "Question",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "Choice 1",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "Choice 2",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "Choice 3",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                                Text(
                                                                  "Choice 4",
                                                                  style: TextStyle(
                                                                      color: Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 30,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "${s.id}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.question}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.choice1}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.choice2}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.choice3}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                Text(
                                                                  "${s.choice4}",
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
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.blue,
                                          )),
                                      IconButton(constraints: BoxConstraints(),padding: EdgeInsetsDirectional.all(5),
                                          onPressed: () {
                                            qn.text = "${s.question}";
                                            c1.text = "${s.choice1}";
                                            c2.text = "${s.choice2}";
                                            c3.text = "${s.choice3}";
                                            c4.text = "${s.choice4}";
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    backgroundColor: Color.fromRGBO(
                                                        255, 255, 255, 0.9),
                                                    title: Row(
                                                      children: [
                                                        Icon(Icons.update_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Update Question")
                                                      ],
                                                    ),
                                                    content: SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Form(
                                                            key: ke3,
                                                            child: Container(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: qn,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .question_mark),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Question',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: c1,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .check_box),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Choice 1',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: c2,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .check_box),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Choice 2',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: c3,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .check_box),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Choice 3',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: c4,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .check_box),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Choice 4',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                    EdgeInsets.all(
                                                                        10),
                                                                    child:
                                                                    TextFormField(
                                                                      controller: can,
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                      InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons
                                                                            .check_box),
                                                                        border:
                                                                        OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        labelText:
                                                                        'Correct Answer',
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
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                              height: 40,
                                                              padding:
                                                              EdgeInsets.fromLTRB(
                                                                  10, 10, 10, 0),
                                                              child: ElevatedButton(
                                                                child: Text('Update'),
                                                                onPressed: () {
                                                                  if (ke3.currentState!
                                                                      .validate()) {
                                                                    ProjectFunctions.updateQuestion(s.id, qn.text, c1.text, c2.text, c3.text, c4.text,can.text,id, context);
                                                                    //Provider.of<SMProvider>(context,listen: false).loadQuestions();
                                                                  }
                                                                },
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.teal,
                                          )),
                                      IconButton(constraints: BoxConstraints(),padding: EdgeInsetsDirectional.all(5),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    title: Text("Delete Item"),
                                                    content: Row(
                                                      children: [
                                                        Icon(Icons.help_outline),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text(
                                                            "Are you sure you want to delete this item"),
                                                      ],
                                                    ),
                                                    actions: [
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                              style: ButtonStyle(
                                                                backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                    Colors.red),
                                                              ),
                                                              onPressed: () {
                                                                ProjectFunctions.removeQuestion(s.id, id,context);
                                                              },
                                                              child: Container(
                                                                  width: 80,
                                                                  child:
                                                                  Text("Delete"))),
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
                                                                Navigator.of(context)
                                                                    .pop();
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
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2,color: Colors.green)),
                                )),
                              ]);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),flex: 12,),
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green.shade300),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade100),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.green,width: 2),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ))),
                          child: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Icon(Icons.question_mark),
                              ],
                            ),
                          ),
                          onPressed: () {
                            ProjectFunctions.buttonAddQuestion(id, context);
                          }
                          ),
                    ],
                  ),
                  flex: 1,
                )

              ],
            )),
      ),
    );
  }
}
