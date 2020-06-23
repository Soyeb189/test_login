import 'package:flutter/material.dart';
import 'package:test_login/AcStatmentModel.dart';
import 'package:test_login/services.dart';

class AcStatement extends StatefulWidget {
  // This widget is the root of your application.
  AcStatement() : super();

  @override
  _AcStatementState createState() => _AcStatementState();
}

class _AcStatementState extends State<AcStatement> {
  final String title = "Account Statment";

  List<AcStatmentModel> acModel;
  @override
  void initState(){
      acModel = [];
      _getAcModel();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: Container(
      //   alignment: Alignment.center,
      //   child: Text("Account Statment"),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text("Serial No"),
                  numeric: false,
                  tooltip: "Serial number for account statment"),
              DataColumn(
                  label: Text("Name"),
                  numeric: false,
                  tooltip: "Name for account statment"),
              DataColumn(
                  label: Text("Date"),
                  numeric: false,
                  tooltip: "Account statment date"),
              DataColumn(
                  label: Text("Balance"),
                  numeric: false,
                  tooltip: "Account Balance"),
              DataColumn(
                label: Text("Debit"),
                numeric: false,
                tooltip: "Account debit"
              ),
              DataColumn(
                label: Text("Credit"),
                numeric: false,
                tooltip: "Account Credit"
              ),
              DataColumn(
                label: Text("Remarks"),
                numeric: false,
                tooltip: "Comments"
              )
            ],
            rows: acModel.map((e) =>DataRow(
                cells: [
                  DataCell(
                    Text(e.id.toString())
                  ),

                  DataCell(
                      Text(e.name.toUpperCase())
                  ),
                  DataCell(
                      Text(e.date)
                  ),
                  DataCell(
                    Text(e.balance.toString())
                  ),
                  DataCell(
                    Text(e.debit.toString())
                  ),
                  DataCell(
                    Text(e.credit.toString())
                  ),
                  DataCell(
                    Text(e.remarks)
                  )
                ]
              ),
            ).toList()
          ),
        ),
      ),
    );
  }

   _getAcModel() {
      Services.getStatment().then((e) {
        setState(() {
          acModel = e;
        });
        print("Length${e.length}");
      });
   }
}
