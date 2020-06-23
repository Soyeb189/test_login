class AcStatmentModel {
  int id;
  String srl_no;
  String name;
  String date;
  double balance;
  double debit;
  double credit;
  String remarks;

  AcStatmentModel(
      {this.id,
      this.srl_no,
      this.name,
      this.date,
      this.balance,
      this.debit,
      this.credit,
      this.remarks});

  factory AcStatmentModel.fromJson(Map<String, dynamic> json) {
    return AcStatmentModel(
      id: json['id'] as int,
      srl_no: json['srl_no'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      balance: json['balance'] as double,
      debit: json['debit'] as double,
      credit: json['credit'] as double,
      remarks: json['remarks'] as String,
    );
  }
}
