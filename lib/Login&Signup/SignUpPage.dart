import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_test/moduls/ProjectFunctions.dart';

class SignUpPage extends StatelessWidget {
  late BuildContext _context;
  _checkApi() async {
    try{
      var request = await http.get(Uri.http("127.0.0.1:8000","/"));
    }catch(e){
      showDialog(
          barrierDismissible: false,
          context: _context,
          builder: (context) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop();

            });
            return AlertDialog(
              content: Text("API Not requested"),
            );
          });
    }
  }
  //Controller Validation
  var ke = GlobalKey<FormState>();
  //Get value from textField
  var un = TextEditingController();
  var pw = TextEditingController();
  var fn = TextEditingController();
  var ln = TextEditingController();
  var em = TextEditingController();
  //Function add user in database

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: ke,
            child: Container(child: Column(children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: un,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "UserName Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: pw,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "PassWord Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'PassWord',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: fn,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "FirstName Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: ln,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "LastName Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Last Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: em,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Email Required";
                    }
                    else{
                      bool state = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value.toString());
                      if (!state){
                        return "No Email, for Example ex@ggg.com";
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
            ],),),
          ),

          Container(
              height: 70,
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child:  Text('Sign Up'),
                onPressed: () {
                  if(ke.currentState!.validate()){
                   ProjectFunctions.signUp(un.text, pw.text, fn.text, ln.text, em.text, context);
                  }

                },
              )
          ),

        ],
      ),
    );
  }
}
