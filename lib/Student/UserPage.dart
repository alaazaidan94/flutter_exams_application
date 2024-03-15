import 'package:flutter/material.dart';
import 'package:project_test/Student/HomeUser.dart';
import 'package:provider/provider.dart';
import '../Login&Signup/MainBody.dart';
import '../moduls/SMPovider.dart';

class UserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.green.shade300, // <-- This works for fixed
          //selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.red,
          onTap: Provider.of<SMProvider>(context).getCurrentIndexUser,
          currentIndex: Provider.of<SMProvider>(context).indexuser,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.quiz_outlined),label: "Exams"),
            BottomNavigationBarItem(icon: Icon(Icons.assessment),label: "Result"),
          ],
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.person),
          actions: [
            IconButton(onPressed: (){
              Provider.of<SMProvider>(context,listen: false).userView=Center(child: Image.asset("images/logo.png"),);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                return MainBody();
              }));
              Provider.of<SMProvider>(context,listen: false).widuser=HomeUser();
            }, icon: Icon(Icons.logout))
          ],

          title: Text("Student Page"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Provider.of<SMProvider>(context).widuser,
      ),
    );
  }
}
