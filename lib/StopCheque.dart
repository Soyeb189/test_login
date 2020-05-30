import 'package:flutter/material.dart';


class StopCheque extends StatelessWidget {
  // This widget is the root of your application.
  StopCheque(): super();
  final String title = "Stop Cheque";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Stop Cheque"),
    ),
  );

 }
                            
                
             
}