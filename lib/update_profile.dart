import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_login/profile.dart';

import 'api.dart';

class UpdateProfile extends StatefulWidget {
  String name,email,presentAddressOld,parmanentAddress,gander,dateOfBirth,mobile;
  var id;
  bool _isloading = false;
  UpdateProfile({this.name,this.email,this.presentAddressOld,this.parmanentAddress,this.mobile,this.gander,this.dateOfBirth,this.id});
  @override
  _UpdateProfileState createState() => _UpdateProfileState(name,email,presentAddressOld,parmanentAddress,gander,dateOfBirth,mobile,id);
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController permanentAddress = new TextEditingController();
  TextEditingController presentAddress = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  final maxline = 5;
  DateTime _dateTime;
  String _gender;
  //String name = nameController.;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  String name,email,presentAddressOld,parmanentAddress,gander,dateOfBirth,mobile;
  var id;

  _UpdateProfileState(this.name,this.email,this.presentAddressOld,this.parmanentAddress,this.mobile,this.gander,this.dateOfBirth,this.id);


  Future<Null> _selectDate(BuildContext context) async {
    var date = DateTime.parse("2019-04-16 12:18:06.018950");

    date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (date != null && date != selectedDate)
      setState(() {
        selectedDate = date;
        var formattedDate = "${date.day}-${date.month}-${date.year}";
        _date.value = TextEditingValue(text: formattedDate);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Your Profile"),
        backgroundColor: Colors.white70,
      ),
      body: Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(primaryColor: Colors.redAccent,),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                      labelText: "Enter your full name",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0
                      ),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red)
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusColor: Colors.black
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
             Container(
               child: Theme(

                 data: Theme.of(context)
                     .copyWith(primaryColor: Colors.redAccent,),
                 child: TextField(
                   controller: permanentAddress,
                   maxLines: null,
                   keyboardType: TextInputType.multiline,
                   decoration: InputDecoration(
                       errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                       labelText: "Parmanent Address",
                       hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 16.0
                       ),
                       prefixIcon: Icon(Icons.home),
                       border: OutlineInputBorder(
                           borderSide: const BorderSide(color: Colors.red)
                       ),
                       focusedBorder:OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black, width: 2.0),
                       ),
                       focusColor: Colors.black
                   ),
                 ),
               ),
             ),

              SizedBox(
                height: 20,
              ),
              Container(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: Colors.redAccent,),
                  child: TextField(
                    controller: presentAddress,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                        labelText: "Present Address",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0
                        ),
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red)
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusColor: Colors.black
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(primaryColor: Colors.redAccent,),
                  child: TextField(
                    controller: phoneNumber,
                    maxLines: null,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                        labelText: "Phone Number",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0
                        ),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red)
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusColor: Colors.black
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Container(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: Colors.redAccent,),
                      child: TextFormField(
                      controller: _date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red)
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusColor: Colors.black
                      ),
                    ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25,),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("You are a "),
                    SizedBox(width: 25,),
                    new DropdownButton<String>(
                        value: _gender,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            _gender = newValue;
                            print(_gender);
                          });
                        },
                        items: <String>['Male','Female'].
                        map((String value){
                          return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value,
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                          );
                        }).toList(),

                    )
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Container(
                child: RaisedButton(
                  onPressed: (){
                    String name = nameController.text;
                    String date = _date.text;
                    print(id);
                    _handleLogin();
//                    Navigator.push(context,
//                        MaterialPageRoute(builder:
//                            (context) => UpdateProfile()));
                  },
                  child: Text("Update"),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black54)
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    ),
    );
  }

  void _handleLogin() async{
    setState(() {
      //_isloading = true;
    });
    var data = {
      'name' : nameController.text,
      'present_address' : presentAddress.text,
      'id' : id.toString(),
      'gender': _gender,
      //'confirmPassword' : confirmPasswordController.text,
    };

    var res = await CallApi().postData(data,'create');

    print('body: [${res.body}]');
    var body = json.decode(res.body);

    if(body['Code']=='1'){
      print('success');
      print(data);
      Navigator.of(context).pushNamed(Profile.tag);
    }else{
      Fluttertoast.showToast(msg: 'Something Wrong');
    }

    setState(() {
     // _isloading = false;
    });
    print(body);

  }
}
