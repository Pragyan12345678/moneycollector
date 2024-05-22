import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/provider/service/services.dart';

class ProfileDataProvider with ChangeNotifier {
  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

Future<void> fetchProfiledata() async {
  print("printing the valuee: $_profiledata");// khali
  print(" lamo");
  var data = await ApiBaseHelper().getprofiledetails("69|X3whfUOo3RJUHQwzIEPvlqK1Rgou4TFhpaJwpv6a507f171e");
  print("printing the $data") ;
  if (data != null) {
  _profiledata.clear(); // Clear the existing list//paile ko dataharu
  
  // Check if data is a list
   ProfileData profile = ProfileData.fromJson(data);
   _profiledata.add(profile);
   
  notifyListeners();
  print('Data received and added to the list');
} else {
  print('No data received from the server');
}

}
 
}

