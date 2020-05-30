import 'package:flutter/material.dart';


class AcBalance extends StatelessWidget {
  // This widget is the root of your application.
  AcBalance(): super();
  final String title = "Account Balance";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Account Balance"),
    ),
  );

 }
                            
                
             
}