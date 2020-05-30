import 'package:flutter/material.dart';


class AcStatement extends StatelessWidget {
  // This widget is the root of your application.
  AcStatement(): super();
  final String title = "Account Statment";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Account Statment"),
    ),
  );

 }
                            
                
             
}