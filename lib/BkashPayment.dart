import 'package:flutter/material.dart';


class BkashPayment extends StatelessWidget {
  // This widget is the root of your application.
  BkashPayment(): super();
  final String title = "Bkash Payment";

  @override              
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Text("Bkash Payment"),
    ),
  );

 }
                            
                
             
}