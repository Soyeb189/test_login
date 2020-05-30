import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:test_login/CardReg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_login/dashbord.dart';

import 'api.dart';

class Login extends StatefulWidget {
  static String tag = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isloading = false;

  bool _isHidden = true;
  var email;
  var password;

  final passwordController = new TextEditingController();
  final emailController = new TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Welcome back,",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "Login to continue",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 40.0,
            ),
            buildTextFieldEmail("Email"),
            SizedBox(
              height: 20.0,
            ),
            buildTextFieldPassword("Password"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 10.0,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(CardReg.tag);
                      },
                      child: new Text("SIGN UP",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                    //Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldEmail(String hintText) {
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
          suffixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(null)),
    );
  }

  Widget buildTextFieldPassword(String hintText) {
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

        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    // return Padding(
    // padding: EdgeInsets.symmetric(vertical: 16.0),

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text(_isloading ? 'Loging.....' : 'Log In',
            style: TextStyle(color: Colors.white)),
        onPressed: _isloading ? null : _handleLogin,
      ),
    );

    //Navigator.of(context).pushNamed(CardReg.tag);
    //       setState(() {
    //         email = emailController.text;
    //         password = nameController.text;
    //       });
    //       Fluttertoast.showToast(
    //         msg: "This is Center Short Toast"+email+password,
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0
    // );

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

  void _handleLogin() async {
    setState(() {
      _isloading = true;
    });
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
      //'confirmPassword' : confirmPasswordController.text,
    };

    var res = await CallApi().postData(data, 'login');
    var body = res.body;
    print('This is '+body);

    print('body: [${res.body}]');
    if (body==null) {
      print("null");
      //body = json.decode(res.body);
    }else if(body!=null){
      body = json.decode(res.body);
      //Fluttertoast.showToast(msg: 'Something');
      
    }

    if (body['email'] != null) {
      print(body['email']);
      print(data);
      Navigator.push(context,
    MaterialPageRoute(builder: (context) => GridViewDemo()),);
      // Fluttertoast.showToast(
      //     msg: "Login Success",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else {
      Fluttertoast.showToast(msg: 'Something Wrong');
    }

    setState(() {
      _isloading = false;
    });
    print(body);
  }
}
