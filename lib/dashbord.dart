import 'package:flutter/material.dart';
import 'package:test_login/AcBalance.dart';
import 'package:test_login/AcStatement.dart';
import 'package:test_login/BkashPayment.dart';
import 'package:test_login/FundTransfer.dart';
import 'package:test_login/MobileRecharge.dart';
import 'package:test_login/PayneerPayment.dart';
import 'package:test_login/StandingIns.dart';
import 'package:test_login/StopCheque.dart';
import 'package:test_login/UtilityBill.dart';
import 'package:test_login/menu.dart';
import 'package:test_login/profile.dart';
import 'package:test_login/services.dart';

import 'CreditCard.dart';
import 'gridcell.dart';

class GridViewDemo extends StatelessWidget {
  // This widget is the root of your application.
  //GridViewDemo() : super();
  final String title = "BCBL";
  String name,email,presentAddress,parmanentAddress,gander,dateOfBirth,mobile;
  var id;
  GridViewDemo({this.name,this.email,this.presentAddress,this.parmanentAddress,this.gander,this.dateOfBirth,this.mobile,this.id});

  @override
  Widget build(BuildContext context) {
    circularProgress() {
      return Center(
        child: const CircularProgressIndicator(),
      );
    }

    gridview(AsyncSnapshot<List<Menu>> snapshot) {
      return Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: snapshot.data.map(
            (menu) {
              return GestureDetector(
                child: GridTile(
                  child: AlbumCell(context, menu),
                ),
                onTap: () {
                  cellClick(context, menu);
                },
              );
            },
          ).toList(),
        ),
      );
    }

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Menu>>(
                future: Services.getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  //
                  if (snapshot.hasData) {
                    //                      streamController.sink.add(snapshot.data.length);
                    //                      // gridview
                    return gridview(snapshot);
                  }

                  return circularProgress();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cellClick(BuildContext context, Menu menu) {
    String actionId = menu.menuActionId;
    switch (actionId) {
      case "1":
        print("A/C Balance");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AcBalance()),
        );
        break;
      case "2":
        print("A/C Statement");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AcStatement()),
        );
        break;
      case "3":
        print("Fund Transfer");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FundTransfer()),
        );
        break;
      case "4":
        print("Standing Ins");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StandingIns(value: name,pass: email,)),
        );
        break;
      case "5":
        print("Mobile Recharge");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MobileRecharge()),
        );
        break;
      case "6":
        print("Utility Bill");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UtilityBill()),
        );
        break;
      case "7":
        print("Bkash Payment");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BkashPayment()),
        );
        break;
      case "8":
        print("Paynoor Payment");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PayneerPayment()),
        );
        break;
      case "9":
        print("Credit Card");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CraditCard()),
        );
        break;
      case "10":
        print("Stop Cheque");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StopCheque()),
        );
        break;
      case "11":
        print("Id: "+id.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile(
            name: name,
            email: email,
            mobile: mobile,
            parmanentAddress: parmanentAddress,
            presentAddress: presentAddress,
            dateOfBirth: dateOfBirth,
            gander: gander,
            id: id,
          )),
        );
        //print("Profile"+dateOfBirth+gander+mobile);
        break;
      default:
    }
  }
}
