import 'package:flutter/material.dart';

class HomeUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal.shade100,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(25),child:ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Text("Welcome In Student Page",style: TextStyle(fontSize: 50,color: Colors.blue),)),
          Container(width: 450,height: 400,child: Image.asset("images/studentlogo.png")),

        ],),
    ],)

    );
  }
}
