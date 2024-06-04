
import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:moneycollection/provider/service/services.dart';

class DepositAccountsProvider with ChangeNotifier {
  List<DepositAccounts> _depositAccounts = [];
  List<DepositAccounts> get depositAccounts => _depositAccounts;


  Future<void> fetchDepositAccounts() async {
    var token = await Preference.getUser();
    print("thisois token${token}");
    var data = await ApiBaseHelper().getdepositeaccount(
        "${token}");
        print(" This is token ${Preference.getUser()}");
    print("Depositaccount state: fetching the account:${data}");
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    if (data != null) {
      _depositAccounts.clear();

      for (var item in data) {
        var depositAccount = DepositAccounts.fromJson(item);
        _depositAccounts.add(depositAccount);
        await dbHelper.newaccount(depositAccount);
      }
      notifyListeners();
      print('Data received and added to the list');
    } else {
      print('No data received from the server');
    }
  }
}
