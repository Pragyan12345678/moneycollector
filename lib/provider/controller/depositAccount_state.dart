
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:moneycollection/provider/service/services.dart';




class DepositAccountsProvider with ChangeNotifier {
  List<DepositAccounts> _depositAccounts = [];
  List<DepositAccounts> get depositAccounts => _depositAccounts;


  List<DepositAccounts> get depositAccountsFilteredByDeposit =>
    _depositAccounts.where((tYPE) => tYPE == 'Deposit').toList();
  


  Future<void> fetchDepositAccounts() async {
    print("printing the valuee: $depositAccounts");
      print("printing the valuee: $depositAccountsFilteredByDeposit");
    print(" lamo");
    var data = await ApiBaseHelper().getdepositeaccount(
        "71|yyVsTgA3hxlYMhRzUi6vFSP9VZGhjIBlmPAF3uSDfb02bae9");
  print("ehis is fetching account${data}");
   DatabaseHelper dbHelper = DatabaseHelper.instance;
    if (data != null) {
      _depositAccounts.clear(); // Clear the existing list//paile ko dataharu
    
    
      for (var item in data) {
         var depositAccount = DepositAccounts.fromJson(item);
    _depositAccounts.add(depositAccount);
    await dbHelper.newaccount(depositAccount);
      }


  // String jsonData = json.encode(data);
      // Preference.storedepositaccount(jsonData);

      //  DatabaseHelper dbHelper = DatabaseHelper.instance;
      //  await dbHelper.newaccount(DepositAccounts.fromJson(data));





      // String jsonData = json.encode(data);
      // Preference.storedepositaccount(jsonData);

      notifyListeners();
      print('Data received and added to the list');
    } else {
      print('No data received from the server');
    }
  }
}
