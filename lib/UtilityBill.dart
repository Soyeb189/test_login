import 'package:flutter/material.dart';


class UtilityBill extends StatelessWidget {
  // This widget is the root of your application.
  UtilityBill(): super();
  final String title = "Utility Bill";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Utility Bill"),
    ),
  );

 }
                            
                
             
}