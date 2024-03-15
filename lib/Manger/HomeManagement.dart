import 'package:flutter/material.dart';
class HomeManagement extends StatefulWidget {

  @override
  State<HomeManagement> createState() => _HomeManagementState();
}

class _HomeManagementState extends State<HomeManagement> {
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
          Container(child: Text("Welcome In Control Panal App",style: TextStyle(fontSize: 50),)),
          Container(width: 250,height: 250,child: Image.asset("images/manglogo.png")),

        ],),
    ],)

    );
  }
}
