import 'package:flutter/material.dart';
import 'package:test_login/update_profile.dart';

class Profile extends StatefulWidget {
  static String tag = 'profile';
  String name,email,presentAddress,parmanentAddress,gander,dateOfBirth,mobile;
  var id;
  Profile({this.name,this.email,this.presentAddress,this.parmanentAddress,this.mobile,this.gander,this.dateOfBirth,this.id});
  @override
  _ProfileState createState() => _ProfileState(name,email,presentAddress,parmanentAddress,gander,dateOfBirth,mobile,id);
}

class _ProfileState extends State<Profile> {
  String name,email,presentAddress,parmanentAddress,gander,dateOfBirth,mobile;
  var id;
  String image = "2";

  _ProfileState(this.name,this.email,this.presentAddress,this.parmanentAddress,this.gander,this.dateOfBirth,this.mobile,this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.cover,
                  image: NetworkImage('https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
              Positioned(
                  bottom: -50.0,
                  child: _image()
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 40,right: 40),
            child: Card(
                elevation: 5,
                color: Colors.white70,
                child:Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(_setName(),textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(_setEmail())
                    ],
                  ),

                )
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 0.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.home,size: 30,color: Colors.teal,),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    "Parmanenet Address: " + _setPAddress(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 0.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.pin_drop,size: 30,color: Colors.teal,),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    "Present Address: " + _setPresentAddress(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 0.0),
            child: Row(
              children: <Widget>[
                Image.asset("assets/birthday.png",width: 30,height: 30,),
                //Tab(icon: new Image.asset("assets/birthday.png"),),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    "Birthday: " + _setBirthday(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 0.0),
            child: Row(
              children: <Widget>[
                Image.asset("assets/gender.png",width: 30,height: 30,),
                //Tab(icon: new Image.asset("assets/birthday.png"),),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    "Gender: " + _setGender(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 0.0),
            child: Row(
              children: <Widget>[
                Image.asset("assets/mobile.png",width: 30,height: 30,),
                //Tab(icon: new Image.asset("assets/birthday.png"),),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    "Phone: " + _setMobile(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: RaisedButton(
              onPressed: (){
                print(id);
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => UpdateProfile(
                          name: name,
                          email: email,
                          mobile: mobile,
                          parmanentAddress: parmanentAddress,
                          presentAddressOld: presentAddress,
                          dateOfBirth: dateOfBirth,
                          gander: gander,
                          id: id,
                        )));
                //print(gander);
              },
              child: Text("Update Your Profile"),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8),
                  side: BorderSide(color: Colors.black54)
              ),
            ),
          ),
        ],
      ),
    );
  }
  _setImage() {
    if(image == "1"){
      return NetworkImage('https://i.dlpng.com/static/png/1647142-profilepng-512512-profile-png-512_512_preview.png');
    }else {
      return NetworkImage('https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png');
    }
  }

  _image() {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(radius: 80,backgroundColor: Colors.white,backgroundImage: _setImage(),),
        Positioned(
          bottom: 2.0,right: 20.0,

          child:
          GestureDetector(
            onTap: (){
              print("camera");
            },
            child: Icon(Icons.add_a_photo,size: 30.0,color: Colors.blue,),
          ),

        )
      ],
    );
  }

  _setPAddress() {
    if(parmanentAddress!=null){
      return parmanentAddress;
    }else{
      return ".............";
    }
  }

  _setPresentAddress() {
    if(presentAddress!=null){
      return presentAddress;
    }else{
      return ".............";
    }
  }

  _setBirthday() {
    if(dateOfBirth!=null){
      return dateOfBirth;
    }else{
      return ".............";
    }
  }

  _setName() {
    if(name!=null){
      return name;
    }else{
      return ".............";
    }
  }
  _setEmail() {
    if(email!=null){
      return email;
    }else{
      return ".............";
    }
  }

  _setGender() {
    if(gander!=null){
      return gander;
    }else{
      return ".............";
    }
  }

  _setMobile() {
    if(mobile!=null){
      return mobile;
    }else{
      return ".............";
    }
  }
}
