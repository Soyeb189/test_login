import 'package:flutter/material.dart';


class FundTransfer extends StatelessWidget {
  // This widget is the root of your application.
  FundTransfer(): super();
  final String title = "Fund Transfer";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Fund Transfer"),
    ),
  );

 }
                            
                
             
}