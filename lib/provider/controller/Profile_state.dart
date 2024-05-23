import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/provider/service/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDataProvider with ChangeNotifier {
  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

Future<void> fetchProfiledata() async {
  print("printing the valuee: $_profiledata");// khali
  print(" lamo");
  var data = await ApiBaseHelper().getprofiledetails("72|npo2oZNrqxsUttSHDyAAUW0A3wISxoPtsCsMi8eXb111bb26");
  print("printing the $data") ;
  if (data != null) {
  _profiledata.clear(); // Clear the existing list//paile ko dataharu
  
  // Check if data is a list
   ProfileData profile = ProfileData.fromJson(data);
   _profiledata.add(profile);
   
    Preference.storeProfile(jsonEncode(data));
   
  notifyListeners();
  print('Data received and added to the list');
} else {
  print('No data received from the server');
}

}
 
}

