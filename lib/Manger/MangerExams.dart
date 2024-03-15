import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../moduls/ProjectFunctions.dart';
import '../moduls/SMPovider.dart';
import 'QuestionsActions.dart';

class MangerExam extends StatelessWidget {
  var keExam = GlobalKey<FormState>();
  var keNumber = GlobalKey<FormState>();
  var num = TextEditingController();
  var ex = TextEditingController();
  var st = TextEditingController();
  var expass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal.shade100,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowHeight: 80,
                          horizontalMargin: 0,
                          columnSpacing: 13,
                          //columnSpacing: 20,
                          columns: [
                            DataColumn(
                              label: Text("ExamName"),
                            ),
                            DataColumn(
                              label: Text("State"),
                            ),
                            DataColumn(
                              label: Text("Qnum"),
                            ),
                            DataColumn(
                              label: Text("Pass"),
                            ),
                            DataColumn(
                              label: Text("Actions"),
                            ),
                          ],
                          rows: [
                            ...Provider.of<SMProvider>(context)
                                .lst_all_exams
                                .map((s) {
                              var x = Colors.red;
                              var y = Icons.clear_outlined;
                              if (s.state == 'enable') {
                                x = Colors.green;
                                y = Icons.check_circle_outline;
                              }
                              return DataRow(cells: [
                                DataCell(Container(
                                  padding: EdgeInsets.all(0),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<SMProvider>(context,
                                                listen: false)
                                                .loadQuestions(s.id);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (_) {
                                              return QuestionsActions(
                                                  s.id, s.examName);
                                            }));
                                          },
                                          child: Text("${s.examName}")),
                                      Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.all(Radius.circular(5)),
                                            border: Border.all(
                                                width: 1, color: Colors.black)),
                                        child: Text("${s.quesNumber}"),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.blue.shade300),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10)),
                                )),
                                DataCell(Center(
                                  child: Icon(
                                    y,
                                    color: x,
                                  ),
                                )),
                                DataCell(TextButton(onPressed: (){
                                  showDialog(context: context, builder: (_){
                                    return AlertDialog(
                                      title: Text("Choice Number Of Questions"),
                                      content: Container(
                                        padding:
                                        EdgeInsets
                                            .all(
                                            10),
                                        child:
                                        Form(
                                          key: keNumber,
                                          child: TextFormField(
                                            controller:
                                            num,
                                            validator:
                                                (value) {
                                              if (value!
                                                  .isEmpty) {
                                                return "QuestionNumber Required";
                                              }
                                              else if(double.tryParse(value) == null){
                                                return "Error Not String";
                                              }
                                              return null;
                                            },
                                            decoration:
                                            InputDecoration(
                                              prefixIcon:
                                              Icon(Icons
                                                  .quiz),
                                              border:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              labelText:
                                              'Question Number',
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(onPressed: (){
                                          if(s.quesNumber! >= int.parse(num.text)){
                                            ProjectFunctions.NumberforStud(s.id, num.text, context);
                                          }
                                          else{
                                            showDialog(context: context, builder: (_){
                                              return AlertDialog(
                                                title: Text("Alert"),
                                                content: Text("Out Of Range"),
                                              );
                                            });
                                          }
                                          num.text = "";
                                        }, child: Text("Enter"))
                                      ],
                                    );
                                  });
                                }, child: Text("${s.quesNumberForStud}",style: TextStyle(color: Colors.purple),))),
                                DataCell(Center(child: Text("${s.password}"))),
                                DataCell(Container(child: Row(
                                  children: [
                                    IconButton(padding: EdgeInsetsDirectional.all(2),constraints: BoxConstraints(),
                                        onPressed: () {
                                          ex.text = "${s.examName}";
                                          expass.text = "${s.password}";
                                          st.text = "${s.state}";
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                  Color.fromRGBO(
                                                      255, 255, 255, 0.9),
                                                  title: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .update_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("Update Exam")
                                                    ],
                                                  ),
                                                  content:
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Form(
                                                          key: keExam,
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      10),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    ex,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "ExamName Required";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration:
                                                                    InputDecoration(
                                                                      prefixIcon:
                                                                      Icon(Icons
                                                                          .quiz),
                                                                      border:
                                                                      OutlineInputBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(20),
                                                                      ),
                                                                      labelText:
                                                                      'Exam Name',
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      10),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    expass,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "PassWord Required";
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
                                                                        BorderRadius.circular(20),
                                                                      ),
                                                                      labelText:
                                                                      'PassWord',
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      10),
                                                                  child:
                                                                  DropdownButtonFormField(
                                                                    decoration:
                                                                    InputDecoration(
                                                                      prefixIcon:
                                                                      Icon(Icons
                                                                          .manage_accounts),
                                                                      labelText:
                                                                      "State",
                                                                      border:
                                                                      OutlineInputBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(20),
                                                                      ),
                                                                    ),
                                                                    items: Provider.of<SMProvider>(
                                                                        context)
                                                                        .listExamState
                                                                        .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                    value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                        value,
                                                                        child: Text(
                                                                            value),
                                                                      );
                                                                    }).toList(),
                                                                    onChanged:
                                                                        (String?
                                                                    value) {
                                                                      Provider.of<SMProvider>(
                                                                          context,
                                                                          listen:
                                                                          false)
                                                                          .changeDropValueState(
                                                                          value);
                                                                    },
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
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Container(
                                                            height: 40,
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                10, 10, 0),
                                                            child:
                                                            ElevatedButton(
                                                              child: Text(
                                                                  'Update'),
                                                              onPressed: () {
                                                                if (keExam
                                                                    .currentState!
                                                                    .validate()) {
                                                                  ProjectFunctions.updateExam(
                                                                      s.id,
                                                                      ex.text,
                                                                      expass
                                                                          .text,
                                                                      Provider.of<SMProvider>(
                                                                          context,
                                                                          listen: false)
                                                                          .dropvalueState,
                                                                      context);
                                                                  ProjectFunctions
                                                                      .getStataExam(
                                                                      s.id,
                                                                      context);
                                                                  Provider.of<SMProvider>(
                                                                      context,
                                                                      listen:
                                                                      false)
                                                                      .changeExamId(
                                                                      s.id);
                                                                  Provider.of<SMProvider>(context,
                                                                      listen: false)
                                                                      .loadQuestions(s.id);
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
                                    IconButton(padding: EdgeInsetsDirectional.all(2),constraints: BoxConstraints(),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: Text("Delete Exam"),
                                                  content: Row(
                                                    children: [
                                                      Icon(Icons.help_outline),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                          "Are you sure you want to delete this Exam"),
                                                    ],
                                                  ),
                                                  actions: [
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                              MaterialStateProperty.all<
                                                                  Color>(
                                                                  Colors
                                                                      .red),
                                                            ),
                                                            onPressed: () {
                                                              ProjectFunctions
                                                                  .removeExam(
                                                                  s.id,
                                                                  context);
                                                            },
                                                            child: Container(
                                                                width: 80,
                                                                child: Text(
                                                                    "Delete"))),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                              MaterialStateProperty.all<
                                                                  Color>(
                                                                  Colors
                                                                      .teal),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                                width: 80,
                                                                child: Text(
                                                                    "Cancel"))),
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
                                ),decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.green),borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),)),
                              ]);
                          })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 12,
              ),
              Expanded(
                child: Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade400),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade100),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.quiz),
                          ],
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 0.9),
                                  title: Row(
                                    children: [
                                      Icon(Icons.add_task),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Add Exam")
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
                                                  padding: EdgeInsets.all(10),
                                                  child: TextFormField(
                                                    controller: ex,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "ExamName Required";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.quiz),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      labelText: 'Exam Name',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: TextFormField(
                                                    controller: expass,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Password Required";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.password),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      labelText: 'PassWord',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child:
                                                      DropdownButtonFormField(
                                                    decoration: InputDecoration(
                                                      prefixIcon: Icon(Icons
                                                          .manage_accounts),
                                                      labelText: "State",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    items: Provider.of<
                                                            SMProvider>(context)
                                                        .listExamState
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? value) {
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .changeDropValueState(
                                                              value);
                                                    },
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
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: ElevatedButton(
                                              child: Text('Add'),
                                              onPressed: () {
                                                if (keExam.currentState!
                                                    .validate()) {
                                                  ProjectFunctions.addExam(
                                                      ex.text,
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .dropvalueState,
                                                      context);
                                                  ex.text="";
                                                  expass.text="";
                                                }
                                              },
                                            )),
                                      ],
                                    )
                                  ],
                                );
                              });
                        }),
                  ],
                ),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
