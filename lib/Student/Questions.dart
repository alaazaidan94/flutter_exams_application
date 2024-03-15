import 'package:flutter/material.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  late BuildContext _context;
Questions(this.BarName);
var BarName;
List<Widget> dddd(){
  List<Widget> lstCont = [];
  for(var i=0;i<Provider.of<SMProvider>(_context).randomItems.length;i++){
    lstCont.add(ElevatedButton(
        style: ElevatedButton.styleFrom(
        //primary: Provider.of<SMProvider>(_context).colo, //background color of button
        side: BorderSide(width:2, color:Colors.brown), //border width and color
        elevation: 3, //elevation of button
        shape: CircleBorder(),
        padding: EdgeInsets.all(20) //content padding inside button
    ),
        onPressed: (){
        Provider.of<SMProvider>(_context,listen: false).changeQuestionIndex(i);
        //Provider.of<SMProvider>(_context,listen: false).changeColor(i);
        print(i+1);
      },child: Text("${i+1}",style: TextStyle(color: Colors.black))));
  }
  return lstCont;
}

  @override
  Widget build(BuildContext context) {
  Provider.of<SMProvider>(context).QuestionContext = context;
  this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz $BarName"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...dddd(),
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
              ),
              //padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Center(child: Text("Question ${Provider.of<SMProvider>(context).questionIndex+1}",style: TextStyle(fontSize: 17),)),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
                color: Colors.teal.shade200,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: ListView(children: [
                  Column(
                    children: [
                      Provider.of<SMProvider>(context).wid2,
                    ],)
                ],)
            ),
            flex: 7,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Provider.of<SMProvider>(context).Button2,
                Provider.of<SMProvider>(context).Button1,
              ],),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
