import 'package:flutter/material.dart';
import 'package:project_test/moduls/SMPovider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:provider/provider.dart';

import 'Login&Signup/MainBody.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_){
        return SMProvider();
      },
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        );
      },)
  );
}

class MyApp extends StatelessWidget {
  var i = 0;
  @override
  Widget build(BuildContext context) {

   // Provider.of<SMProvider>(context).contextMain = context;
    if(i == 0){
      //Provider.of<SMProvider>(context).loadQuestions();
      Provider.of<SMProvider>(context).loadUsers();
      Provider.of<SMProvider>(context).loadExams();
      i++;
    }
    Widget example1 = SplashScreenView(
      navigateRoute: MainBody(),
      duration: 10,
      imageSize: 130,
      imageSrc: "images/logo.png",
      text: "Exams System",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
        Colors.green,
      ],
      backgroundColor: Colors.white,
    );

    return example1;
  }
}