import 'package:flutter/material.dart';


class CraditCard extends StatelessWidget {
  // This widget is the root of your application.
  CraditCard(): super();
  final String title = "Cradit Card";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Cradit Card"),
    ),
  );

 }
                            
                
             
}