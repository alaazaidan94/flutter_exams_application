import 'package:flutter/material.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

import 'ReviewManger.dart';

class UserResultManger extends StatelessWidget {
  const UserResultManger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: ListView(
                  children: [
                    DataTable(
                      columnSpacing: 20,
                        columns: [
                      DataColumn(label: Text("Info")),
                      DataColumn(label: Text("ExamName")),
                      DataColumn(label: Text("Result")),
                    ], rows: [
                      ...Provider.of<SMProvider>(context)
                          .lst_result_Manger1
                          .map((e) {
                        return DataRow(cells: [
                          DataCell(Container(
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 20,
                                      child: Text(
                                        "${e.fullName.toString().characters.first.toUpperCase()}",
                                        style: TextStyle(
                                            color: Colors.teal.shade100,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${e.fullName}"),
                                    Text(
                                      "ID: ${e.id}",
                                      style: TextStyle(
                                          color: Colors.teal.shade400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                          DataCell(TextButton(
                              onPressed: () {
                                Provider.of<SMProvider>(context,listen: false).loadReview(e.username, e.examName);
                                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return ReviewManger(e.fullName,e.id,e.username,e.examName);
                                }));
                              },
                              child: Text(
                                "${e.examName}",
                                style: TextStyle(color: Colors.purple),
                              ))),
                          DataCell(Container(padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border:
                                      Border.all(width: 2, color: Colors.blue)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.tureAnswer}",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Text("/"),
                                  Text(
                                    "${e.totalQuestion}",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ))),
                        ]);
                      }),
                    ]),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
