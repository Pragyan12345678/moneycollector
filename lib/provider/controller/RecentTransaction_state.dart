import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Map<String, String>> _transactions = [
    {
      "title": "Recent Transaction 1",
      "transfer": "Pragyan Maharjan", 
      "amount": "NPR. 70000",
    },
    {
      "title": "Recent Transaction 2",
      "transfer": "Pragyan Maharjan", 
      "amount": "NPR. 60000",
    },
    {
      "title": "Recent Transaction 5",
       "transfer": "Pragyan Maharjan",
      "amount": "NPR. 50000",
    },
    {
      "title": "Recent Transaction 4",
        "transfer": "Pragyan Maharjan",
      "amount": "NPR. 40000",
    },
     {
      "title": "Recent Transaction 4",
        "transfer": "Pragyan Maharjan",
      "amount": "NPR. 40000",
    },
     {
      "title": "Recent Transaction 4",
        "transfer": "Pragyan Maharjan",
      "amount": "NPR. 40000",
    },
     {
      "title": "Recent Transaction 4",
        "transfer": "Pragyan Maharjan",
      "amount": "NPR. 40000",
    },
  ];

  List<Map<String, String>> get transactions => _transactions;

  void addTransaction(Map<String, String> transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
