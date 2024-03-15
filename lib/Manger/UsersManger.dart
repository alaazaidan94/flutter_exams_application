import 'package:flutter/material.dart';
import 'package:project_test/Manger/UsersActions.dart';
import 'UserResultManger.dart';

class UsersManger extends StatelessWidget {
  late BuildContext _context;
  int gen = 0;
  var ke1 = GlobalKey<FormState>();
  var un = TextEditingController();
  var pw = TextEditingController();
  var fn = TextEditingController();
  var ln = TextEditingController();
  var em = TextEditingController();


  @override
  Widget build(BuildContext context) {
    this._context = context;
    return DefaultTabController(
      length: 2,
      animationDuration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar:PreferredSize(

      preferredSize: Size.fromHeight(26),
      child:  AppBar(
        backgroundColor: Colors.red.shade200,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Material(
              color: Colors.brown.shade200,
              child: TabBar(
                labelColor: Colors.yellow.shade100,
                  unselectedLabelColor: Colors.green.shade100,
                  indicatorColor: Colors.blue,
                  tabs: [
                Row(
                  children: [Icon(Icons.person),SizedBox(width: 10,),Text("Students") ],
                ),
                Row(
                  children: [Icon(Icons.app_registration),SizedBox(width: 10,),Text("Students Results")],
                ),
              ]),
            ),
          ),
        ),),
        body: TabBarView(children: [
              UsersActions(),
              UserResultManger()
        ]),
      ),
    );
  }
}
