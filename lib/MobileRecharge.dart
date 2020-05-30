import 'package:flutter/material.dart';


class MobileRecharge extends StatelessWidget {
  // This widget is the root of your application.
  MobileRecharge(): super();
  final String title = "Mobile Recharge";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Mobile Recharge"),
    ),
  );

 }
                            
                
             
}