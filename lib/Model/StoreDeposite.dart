class DepositeEntries {
  String? tranad;
  String? tranbs;
  String? accountno;
  String? amount;
  String? depositby;
  String? sourceIncome;

  DepositeEntries(
      {this.tranad,
      this.tranbs,
      this.accountno,
      this.amount,
      this.depositby,
      this.sourceIncome});

  DepositeEntries.fromJson(Map<String, dynamic> json) {
    tranad = json['tranad'];
    tranbs = json['tranbs'];
    accountno = json['accountno'];
    amount = json['amount'];
    depositby = json['depositby'];
    sourceIncome = json['sourceIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tranad'] = this.tranad;
    data['tranbs'] = this.tranbs;
    data['accountno'] = this.accountno;
    data['amount'] = this.amount;
    data['depositby'] = this.depositby;
    data['sourceIncome'] = this.sourceIncome;
    return data;
  }
}
