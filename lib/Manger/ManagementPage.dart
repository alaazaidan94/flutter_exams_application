import 'package:flutter/material.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

import '../Login&Signup/MainBody.dart';



class ManagementPage extends StatelessWidget {
  late BuildContext _MangPageContext;

  @override
  Widget build(BuildContext context) {
    this._MangPageContext = context;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor: Colors.green.shade200, // <-- This works for fixed
            //selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.grey,
            fixedColor: Colors.red,
            onTap: Provider.of<SMProvider>(context).getCurrentIndexManger,
            currentIndex: Provider.of<SMProvider>(context).indexmanger,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Users"),
              BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings),label: "Management"),
              BottomNavigationBarItem(icon: Icon(Icons.quiz_outlined),label: "Exams"),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle_outlined),label: "Add")
            ],
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: Icon(Icons.settings),
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                  return MainBody();
                }));
              }, icon: Icon(Icons.logout))
            ],

            title: Row(children: [
              Text("Control Panel"),
              SizedBox(width: 20,),
              Text("( ${Provider.of<SMProvider>(context).appBarText} )",style: TextStyle(color: Colors.red),),
            ],),
            backgroundColor: Colors.green,
          ),
          body: Provider.of<SMProvider>(context).widmanger,
        ),
      );

  }
}