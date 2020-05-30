import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_login/Login.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'api.dart';

class CardReg extends StatefulWidget {
  static String tag = 'card_reg';
  @override
  _CardRegState createState() => new _CardRegState();
}

class _CardRegState extends State<CardReg> {

 var email ;
 var password ;
 var confirmPassword ;

 final emailController = new TextEditingController();
 final passwordController = new TextEditingController();
 final confirmPasswordController = new TextEditingController();

 bool _isloading = false;

 bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
     backgroundColor: Colors.orange,
      resizeToAvoidBottomPadding: false,
      
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 100.0,right: 30.0,bottom: 100.0,left: 30.0),
        padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          //BorderRadius: BorderRadius.circular(24.0),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: 40.0,),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 80.0,),
            buildTextFieldEmail("Email"),
            SizedBox(height: 20.0,),
            buildTextField("Password"),
            SizedBox(height: 20.0,),
            buildTextFieldConfirm("Confirm Password"),
            SizedBox(height: 20.0,),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Text(
            //         "Forgotten Password?",
            //         style: TextStyle(
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
          
           
          ],
        ),
      ),
    );
  }

   Widget buildTextFieldEmail(String hintText){
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        suffixIcon: hintText == "Email" ? Icon(Icons.email): Icon(null)
        
      ),
      
    );
  }

  Widget buildTextField(String hintText){
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        suffix: hintText == "Email" ? Icon(Icons.email) : Icon(null),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }
    Widget buildTextFieldConfirm(String hintText){
    return TextField(
      controller: confirmPasswordController,
      decoration: InputDecoration(
        labelText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        suffixIcon: hintText == "Confirm Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == "Confirm Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer(){
      // return Padding(
      // padding: EdgeInsets.symmetric(vertical: 16.0),
  
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 6.0),
       child:RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
         padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text( _isloading ? 'Creating.....': 'Register', style: TextStyle(color: Colors.white)),
        onPressed:_isloading ? null : _handleLogin,
        
        // onPressed: () {
          
        //   _isloading ? null : _handleLogin();
        //             // setState(() {
        //             //   email = emailController.text;
        //             //   password = passwordController.text;
        //             //   confirmPassword = confirmPasswordController.text;
        //             // });
        //             // Fluttertoast.showToast(msg: email+password+confirmPassword);
        //           },
                 
                ),
                );
              // );
              // return Container(
              //   height: 56.0,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(3.0),
              //     gradient: LinearGradient(
              //       colors: [
              //         Color(0xFFFB415B),
              //         Color(0xFFEE5623)
              //       ],
              //       begin: Alignment.centerRight,
              //       end: Alignment.centerLeft
              //     ),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "LOGIN",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18.0,
              //       ),
              //     ),
              //   ),
              // );
          
            }
          
            void _handleLogin() async{
              setState(() {
                _isloading = true;
              });
              var data = {
                'email' : emailController.text,
                'password' : passwordController.text,
                //'confirmPassword' : confirmPasswordController.text,
              };

              var res = await CallApi().postData(data,'create');
              
              print('body: [${res.body}]');
              var body = json.decode(res.body);

              if(body['Code']=='1'){
                print('success');
                print(data);
                Navigator.of(context).pushNamed(Login.tag);
              }else{
                Fluttertoast.showToast(msg: 'Something Wrong');
              }

              setState(() {
                _isloading = false;
              });
              print(body);
            
            }
}