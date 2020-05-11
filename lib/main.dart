

import 'package:flutter/material.dart';
import 'package:test_login/CardReg.dart';
import 'package:test_login/Login.dart';
import 'LoginPage.dart';
import 'RegPage.dart';
import 'CardReg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

 final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    RegPage.tag: (context) => RegPage(),
    Login.tag:(context) => Login(),
    CardReg.tag:(context) => CardReg(),
  };


    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: Login(),
      routes: routes,
    );
  }
  
}

