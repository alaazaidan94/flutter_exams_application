import 'package:flutter/material.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade100,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(width: 3, color: Colors.green)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.blue.shade400,borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),),
                          //color: Colors.blue.shade400,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.blue.shade300,
                                      child: Center(
                                          child: Text(
                                        "${Provider.of<SMProvider>(context).charNameUser}",
                                        style: TextStyle(
                                            fontSize: 55, color: Colors.red),
                                      ))),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                          Text(
                                            "Name:  ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],),

                                        Text(
                                          "ID:  ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),flex: 1,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${Provider.of<SMProvider>(context).fullNameUser}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        Text(
                                          "${Provider.of<SMProvider>(context).idUser}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ],
                                    ),flex: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                child: DataTable(
                                  columnSpacing: 15,
                                    headingRowColor:
                                    MaterialStateColor.resolveWith((states) => Colors.green),
                                    dataRowHeight: 30,
                                    columns: [
                                  DataColumn(
                                      label: Text(
                                    "ExamName",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Result",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "",
                                  )),
                                ], rows: [
                                  ...Provider.of<SMProvider>(context)
                                      .lst_user_result
                                      .map((e) {
                                    return DataRow(cells: [
                                      DataCell(Text("${e.examName}")),
                                      DataCell(Row(children: [
                                        Text("${e.tureAnswer}",style: TextStyle(color: Colors.orange),),
                                        Text("/"),
                                        Text("${e.totalQuestion}",style: TextStyle(color: Colors.red)),
                                      ],)),
                                      DataCell(TextButton(
                                          onPressed: () {
                                            Provider.of<SMProvider>(context,
                                                    listen: false)
                                                .changeUserView(context);
                                            Provider.of<SMProvider>(context,
                                                    listen: false)
                                                .loadReview(e.username, e.examName);
                                          },
                                          child: Text("Review",style: TextStyle(color: Colors.purple.shade300),))),
                                    ]);
                                  }),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 370,
                          decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 3, color: Colors.green)),
                          child: Provider.of<SMProvider>(context).userView,
                        )
                      ],
                    )),
              ),
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
