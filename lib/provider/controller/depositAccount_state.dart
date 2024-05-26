// import 'package:moneycollection/Model/DepositAccounts.dart';
// import 'package:moneycollection/provider/service/services.dart';

// class Accounts {
//   Future<List<DepositAccounts>> fetchAddresses() async {
//     try {
//       // Fetch deposit accounts data and return it
//       var data = await ApiBaseHelper().getdepositeaccount();
//       if (data != null) {
//         // Parse data and return a list of DepositAccounts
//         List<DepositAccounts> depositAccounts = List<DepositAccounts>.from(data.map((model) => DepositAccounts.fromJson(model)));
//         return depositAccounts;
//       } else {
//         // Return an empty list if data is null
//         return [];
//       }
//     } catch (error) {
//       // Handle errors or exceptions
//       print(error);
//       throw error;
//     }
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:moneycollection/Model/DepositAccounts.dart';

// Future<List<DepositAccounts>> fetchAccounts(String token) async {
//   final response = await http.get(
//     Uri.parse('http://192.168.1.13:8102/api/accounts/'),
//     headers: <String, String>{
//       'Authorization': 'Bearer $token',
//     },
//   );

//   if (response.statusCode == 200) {
//     List<dynamic> jsonList = json.decode(response.body);
//     return jsonList.map((json) => DepositAccounts.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load accounts');
//   }
// }

// void main() async {
//   String token = "16|rAS95XAXhsjNw6chXHWEW6Z4ffsD4t4JNePeHxX37beedd84";

//   try {
//     List<DepositAccounts> accounts = await fetchAccounts(token);
//     // Now you can use the fetched accounts
//     print(accounts);
//   } catch (e) {
//     print('Error: $e');
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/provider/service/services.dart';




class DepositAccountsProvider with ChangeNotifier {
  List<DepositAccounts> _depositAccounts = [];



  List<DepositAccounts> get depositAccounts => _depositAccounts;
  

  Future<void> fetchDepositAccounts() async {
    print("printing the valuee: $depositAccounts");
    print(" lamo");
    var data = await ApiBaseHelper().getdepositeaccount(
        "71|yyVsTgA3hxlYMhRzUi6vFSP9VZGhjIBlmPAF3uSDfb02bae9");

    if (data != null) {
      _depositAccounts.clear(); // Clear the existing list//paile ko dataharu
      print(data);
    
      for (var item in data) {
        _depositAccounts.add(DepositAccounts.fromJson(item));
      }
      String jsonData = json.encode(data);
      Preference.storedepositaccount(jsonData);

      notifyListeners();
      print('Data received and added to the list');
    } else {
      print('No data received from the server');
    }
  }
}
