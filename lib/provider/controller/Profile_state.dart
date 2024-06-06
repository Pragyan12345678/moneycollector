import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/provider/service/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDataProvider with ChangeNotifier {

String? profileData;
  Future<void> loadProfileData() async {
    String? data = await Preference.getProfile();
   
      profileData = data;
      print(" Profile page :Profile data load from preference: ${profileData}");
  notifyListeners();
  }

  Future<void> loadDepositeData() async {
    String? data = await Preference.getDepositeaccount();

      profileData = data;
      print("Profile page: Deposit account load from preference:${profileData}");
      notifyListeners();
  
  }

// initializationorifu()  {
//   try {
//     String? profile; 
//      Preference.getProfile().then((result){
//       profile = result;
   
//     if (profile != null && profile is String) {
//       print("printing the valueddddd${profile}");
//       Map<String, dynamic> profileData = json.decode(profile!);
//       _profiledata.add(ProfileData.fromJson(profileData));
//     } else {
//       // Handle null or invalid profile data
//       print("Profile ${_profiledata}");
//     }
//      });
//   } catch (error) {
//     // Handle error if any
//     print("Error fetching profile data: $error");
//   }
// }


  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

Future<void> fetchProfiledata() async {
  print("printing the valueess: $_profiledata");// khali
  print(" lamo");
   var token = await Preference.getUser();
    print("thisois token${token}");
  var data = await ApiBaseHelper().getprofiledetails("${token}");
  print("printing the $data") ;
  if (data != null) {
  _profiledata.clear(); // Clear the existing list//paile ko dataharu
  
  // Check if data is a list
   ProfileData profile = ProfileData.fromJson(data);
   _profiledata.add(profile);
   

      String jsonData = json.encode(data);
      
      Preference.storeProfile(jsonData);
    // Preference.storeProfile(data);
   
  notifyListeners();
  print('Data received and added to the list');
} else {
  print('No data received from the server');
}

}
 
}

