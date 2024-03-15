import 'package:flutter/material.dart';

class AddActions extends StatelessWidget {
  late BuildContext _context;

  var ke1 = GlobalKey<FormState>();
  var un = TextEditingController();
  var pw = TextEditingController();
  var fn = TextEditingController();
  var ln = TextEditingController();
  var em = TextEditingController();

  var ke2 = GlobalKey<FormState>();
  var unn = TextEditingController();
  var pww = TextEditingController();

  var ke3 = GlobalKey<FormState>();
  var qn = TextEditingController();
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var c3 = TextEditingController();
  var c4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Container(padding: EdgeInsets.all(8),child: ElevatedButton(onPressed: (){
                showDialog(context: _context, builder: (_){
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
                    title: Row(children: [
                      Icon(Icons.person_add),
                      SizedBox(width: 10,),
                      Text("Add User")
                    ],),
                    content: SingleChildScrollView(
                      child: Column(children: [
                        Form(
                          key: ke1,
                          child: Container(child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: un,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'UserName',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: pw,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.security),
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
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'FirstName',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: ln,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'LastName',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: em,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
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

                      ],),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 40,
                              padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: ElevatedButton(
                                child:  Text('Add'),
                                onPressed: () {
                                  if(ke1.currentState!.validate()){

                                  }
                                },
                              )
                          ),
                        ],)
                    ],

                  );
                });
              }, child: Container(child: Row(children: [Icon(Icons.person_add),SizedBox(width: 10,),Text("Add User")],),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade400),)),),
              Container(padding: EdgeInsets.all(8),child: ElevatedButton(onPressed: (){
                showDialog(context: _context, builder: (_){
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
                    title: Row(children: [
                      Icon(Icons.person_add),
                      SizedBox(width: 10,),
                      Text("Add Management")
                    ],),
                    content: SingleChildScrollView(
                      child: Column(children: [
                        Form(
                          key: ke2,
                          child: Container(child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: unn,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
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
                                controller: pww,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
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
                          ],),),
                        ),

                      ],),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 40,
                              padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: ElevatedButton(
                                child:  Text('Add'),
                                onPressed: () {
                                  if(ke2.currentState!.validate()){

                                  }

                                },
                              )
                          ),
                        ],)
                    ],

                  );
                });
              }, child: Container(child: Row(children: [Icon(Icons.manage_accounts),SizedBox(width: 10,),Text("Add Management")],),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade400),)),),
              Container(padding: EdgeInsets.all(8),child: ElevatedButton(onPressed: (){
                showDialog(context: _context, builder: (_){
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
                    title: Row(children: [
                      Icon(Icons.person_add),
                      SizedBox(width: 10,),
                      Text("Add Management")
                    ],),
                    content: SingleChildScrollView(
                      child: Column(children: [
                        Form(
                          key: ke3,
                          child: Container(child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: qn,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.question_mark),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Question',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: c1,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.check_box),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Choice 1',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: c2,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.check_box),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Choice 2',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: c3,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.check_box),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Choice 3',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: c4,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Input Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.check_box),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Choice 4',
                                ),
                              ),
                            ),

                          ],),),
                        ),

                      ],),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 40,
                              padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: ElevatedButton(
                                child:  Text('Add'),
                                onPressed: () {
                                  if(ke3.currentState!.validate()){
                                  }
                                },
                              )
                          ),
                        ],)
                    ],

                  );
                });
              }, child: Container(child: Row(children: [Icon(Icons.question_mark),SizedBox(width: 10,),Text("Add Question")],),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade400),)),),



            ],
          ),
        ),
      ),
    );
  }
}
