import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Map<String, String>> _transactions = [
    {
      "title": "Recent Transaction 1",
      "amount": "NPR. 70000",
    },
    {
      "title": "Recent Transaction 2",
      "amount": "NPR. 60000",
    },
    {
      "title": "Recent Transaction 3",
      "amount": "NPR. 50000",
    },
    {
      "title": "Recent Transaction 4",
      "amount": "NPR. 40000",
    },
  ];

  List<Map<String, String>> get transactions => _transactions;

  void addTransaction(Map<String, String> transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
