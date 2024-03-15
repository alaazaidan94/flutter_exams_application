import 'package:flutter/material.dart';
import 'package:project_test/moduls/ProjectFunctions.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:provider/provider.dart';
class UsersActions extends StatelessWidget {
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
    return Container(
      color: Colors.teal.shade100,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...Provider.of<SMProvider>(context)
                      .lst_all_users
                      .map((s) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [CircleAvatar(backgroundColor: Colors.yellow.shade100,radius: 20,child: Text("${s.roles.toString().characters.first.toUpperCase()}",style: TextStyle(color: Colors.red,fontSize: 25,),),)],),flex: 1,
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [Text("${s.username}"),Text("${s.roles}",style: TextStyle(color: Colors.teal.shade500),)],),flex: 3,
                                      )

                                    ],),)
                                ],),flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [Text("${s.password}",style: TextStyle(color: Colors.purple),)],),flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(padding: EdgeInsets.all(5),constraints: BoxConstraints(),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                    Colors.teal.shade200,
                                                    title: Row(
                                                      children: [
                                                        Icon(Icons.details_outlined),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text("User Details"),
                                                      ],
                                                    ),
                                                    content: Container(
                                                      height: 150,
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "Id",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "UserName",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "Password",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "First Name",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "Last Name",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "Email",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                              Text(
                                                                "Type",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.red),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "${s.id}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.username}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.password}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.firstname}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.lastname}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.email}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              Text(
                                                                "${s.roles}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.blue,
                                          )),
                                      IconButton(padding: EdgeInsets.all(5),constraints: BoxConstraints(),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                    Color.fromRGBO(255, 255, 255, 0.9),
                                                    title: Row(
                                                      children: [
                                                        Icon(Icons.person_add),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Edite User  (${s.username})")
                                                      ],
                                                    ),
                                                    content: SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Form(
                                                            key: ke1,
                                                            child: Container(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(10),
                                                                    child: TextFormField(
                                                                      controller: pw,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty) {
                                                                          return "Input Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                        prefixIcon:
                                                                        Icon(Icons.security),
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                        ),
                                                                        labelText: 'PassWord',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(10),
                                                                    child: DropdownButtonFormField(
                                                                      decoration: InputDecoration(
                                                                        prefixIcon: Icon(Icons.manage_accounts),
                                                                        labelText: "Roles",

                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                        ),
                                                                      ),
                                                                      items: Provider.of<
                                                                          SMProvider>(context)
                                                                          .listDrop
                                                                          .map<
                                                                          DropdownMenuItem<
                                                                              String>>(
                                                                              (String value) {
                                                                            return DropdownMenuItem<
                                                                                String>(
                                                                              value: value,
                                                                              child: Text(value),
                                                                            );
                                                                          }).toList(),
                                                                      onChanged: (String? value) {
                                                                        Provider.of<SMProvider>(
                                                                            context,
                                                                            listen: false)
                                                                            .changeDropValue(value);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                              height: 40,
                                                              padding: EdgeInsets.fromLTRB(
                                                                  10, 10, 10, 0),
                                                              child: ElevatedButton(
                                                                child: Text('Update'),
                                                                onPressed: () {
                                                                  if (ke1.currentState!
                                                                      .validate()) {
                                                                    ProjectFunctions.updateUser(
                                                                        s.id,
                                                                        pw.text,
                                                                        Provider.of<SMProvider>(context,listen: false).dropvalue,
                                                                        context);
                                                                  }
                                                                },
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.teal,
                                          )),
                                      IconButton(padding: EdgeInsets.all(5),constraints: BoxConstraints(),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    title: Text("Delete Item"),
                                                    content: Row(
                                                      children: [
                                                        Icon(Icons.help_outline),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text(
                                                            "Are you sure you want to delete this item"),
                                                      ],
                                                    ),
                                                    actions: [
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                              style: ButtonStyle(
                                                                backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                    Colors
                                                                        .red),
                                                              ),
                                                              onPressed: () {
                                                                ProjectFunctions
                                                                    .removeUser(s.id,
                                                                    context);
                                                              },
                                                              child: Container(
                                                                  width: 80,
                                                                  child: Text(
                                                                      "Delete"))),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          ElevatedButton(
                                                              style: ButtonStyle(
                                                                backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                    Colors
                                                                        .teal),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                  width: 80,
                                                                  child: Text(
                                                                      "Cancel"))),
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          )),

                                    ],
                                  ),
                                ],),flex: 1,
                            ),

                          ],),
                      ),
                    );
                  })
                ],
              ),
              flex: 12,
            ),
            Expanded(
              child: Row(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade400),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue.shade100),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add),
                        ],
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor:
                                Color.fromRGBO(255, 255, 255, 0.9),
                                title: Row(
                                  children: [
                                    Icon(Icons.person_add),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Add User")
                                  ],
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Form(
                                        key: ke1,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: TextFormField(
                                                  controller: un,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Input Required";
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.person),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
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
                                                    if (value!.isEmpty) {
                                                      return "Input Required";
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.security),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
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
                                                    if (value!.isEmpty) {
                                                      return "Input Required";
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.person),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
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
                                                    if (value!.isEmpty) {
                                                      return "Input Required";
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.person),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
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
                                                    if (value!.isEmpty) {
                                                      return "Input Required";
                                                    } else {
                                                      bool state = RegExp(
                                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                          .hasMatch(
                                                          value.toString());
                                                      if (!state) {
                                                        return "No Email, for Example ex@ggg.com";
                                                      }
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.email),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                    labelText: 'Email',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.manage_accounts),
                                                    labelText: "Roles",

                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                  ),
                                                  items: Provider.of<
                                                      SMProvider>(context)
                                                      .listDrop
                                                      .map<
                                                      DropdownMenuItem<
                                                          String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                  onChanged: (String? value) {
                                                    Provider.of<SMProvider>(
                                                        context,
                                                        listen: false)
                                                        .changeDropValue(value);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 40,
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: ElevatedButton(
                                            child: Text('Add'),
                                            onPressed: () {
                                              if (ke1.currentState!
                                                  .validate()) {
                                                ProjectFunctions.addUser(
                                                    un.text,
                                                    pw.text,
                                                    fn.text,
                                                    ln.text,
                                                    em.text,
                                                    Provider.of<SMProvider>(context,listen: false).dropvalue,
                                                    context);
                                              }
                                            },
                                          )),
                                    ],
                                  )
                                ],
                              );
                            });
                      }),
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
