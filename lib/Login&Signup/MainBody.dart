import 'package:flutter/material.dart';
import 'package:project_test/Login&Signup/SignUpPage.dart';

import 'LoginPage.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("builder Main Body");
    return SafeArea(
      child: DefaultTabController(
        animationDuration: Duration(milliseconds: 500),
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Material(
                  color: Colors.green.shade300,
                  child: TabBar(tabs: [
                    Row(
                      children: [Icon(Icons.login),SizedBox(width: 10,),Text("Log In") ],
                    ),
                    Row(
                      children: [Icon(Icons.app_registration),SizedBox(width: 10,),Text("Sign Up")],
                    ),
                  ]),
                ),
              ),
              title: Center(child: Text("Electronic Exam System")),
              backgroundColor: Colors.green,
            ),
          ),
          body: TabBarView(children: [
            LoginPage(),
            SignUpPage(),
          ]),
        ),
      ),
    );
  }

}
