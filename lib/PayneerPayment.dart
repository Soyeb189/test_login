import 'package:flutter/material.dart';


class PayneerPayment extends StatelessWidget {
  // This widget is the root of your application.
  PayneerPayment(): super();
  final String title = "Payneer Payment";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Payneer Payment"),
    ),
  );

 }
                            
                
             
}