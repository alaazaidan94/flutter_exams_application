import 'package:flutter/material.dart';
import 'package:project_test/moduls/ProjectFunctions.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  //TextFormField validation
  final ke1 = GlobalKey<FormState>();
  //get value from textField by controller
  var un = TextEditingController();
  var pw = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: <Widget>[
            Container(
                width: 100,
                height: 300,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Image.asset("images/logo.png")),
            Container(
            padding: EdgeInsets.all(10),
              child: Form(
                key: ke1,
                  child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "UserName Required";
                      }
                      return null;
                    },
                    controller: un,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.green
                        )
                      ),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'User Name',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "PassWord Required";
                      }
                      return null;
                    },
                    obscureText: Provider.of<SMProvider>(context).stateObscure,
                    controller: pw,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<SMProvider>(context,listen: false).changeObscureText();
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.green,
                          )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ],
              )),
            ),
            TextButton(onPressed: () {},
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding:  EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade400),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 10,),
                      Text('Login'),
                    ],
                  ),
                  onPressed: () {
                    if(ke1.currentState!.validate()){
                     ProjectFunctions.logIn(un.text, pw.text, context);
                     ProjectFunctions.getFullNameUser(un.text,context);

                    }
                  }
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ), onPressed: () {},
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      );
  }
}
