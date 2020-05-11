import 'package:flutter/material.dart';
import 'package:test_login/CardReg.dart';




class Login extends StatefulWidget{
 static String tag = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 40.0,),
            Text(
              "Welcome back,",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            Text(
              "Login to continue",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).accentColor
              ),
            ),
            SizedBox(height: 40.0,),
            buildTextField("Email"),
            SizedBox(height: 20.0,),
            buildTextField("Password"),
            SizedBox(height: 20.0,),
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
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(width: 10.0,),
                     new GestureDetector(
                      onTap: () {
                      Navigator.of(context).pushNamed(CardReg.tag);
                      },
                      child: new Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,)),
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

  Widget buildTextField(String hintText){
    return TextField(
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
        
        onPressed: () {
          //Navigator.of(context).pushNamed(CardReg.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
         child: Text('Log In', style: TextStyle(color: Colors.white)),
        
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
}