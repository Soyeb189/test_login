import 'package:flutter/material.dart';


class StandingIns extends StatelessWidget {
  // This widget is the root of your application.
  StandingIns(): super();
  final String title = "Standing Ins.....";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Standing Ins....."),
    ),
  );

 }
                            
                
             
}