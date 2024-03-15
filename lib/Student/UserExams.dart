import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduls/SMPovider.dart';

class UserExamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SMProvider>(context).Contextt = context;
    return Container(
      color: Colors.teal.shade200,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container(),flex: 2,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          border: Border.all(
                            width: 3,
                            color: Colors.green.shade500,
                          ),
                          color: Colors.blue.shade200,
                        ),
                        //padding: EdgeInsets.all(20),
                        width: double.infinity,
                        height: 300,
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade500,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  "Choose an exam",
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ),flex: 3),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Provider.of<SMProvider>(context).ExamBottom,
                              ],),
                            flex: 7,),
                          ],
                        ))
                  ],
                ),
              ),flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
