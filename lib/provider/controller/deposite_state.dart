import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/modules/Deposit/Deposite.dart';
import 'package:moneycollection/modules/Loan/Loan.dart';
import 'package:moneycollection/provider/service/services.dart';

class LoanStateProvider with ChangeNotifier {
  final TextEditingController trandatead = TextEditingController();
  final TextEditingController trandatebs = TextEditingController();
  final TextEditingController accountnumber = TextEditingController();
  final TextEditingController clientid = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController depositeby = TextEditingController();
  final TextEditingController sourceIncome = TextEditingController();
  final TextEditingController depositecode = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController branch = TextEditingController();
  final TextEditingController account = TextEditingController();

  //loan
  final TextEditingController loantrandatead = TextEditingController();
  final TextEditingController loantrandatebs = TextEditingController();
  final TextEditingController loanaccountnumber = TextEditingController();
  final TextEditingController loanclientid = TextEditingController();
  final TextEditingController loanamount = TextEditingController();
  final TextEditingController loandepositecode = TextEditingController();
  final TextEditingController loandepositeby = TextEditingController();
  final TextEditingController loansourceIncome = TextEditingController();
  final TextEditingController loanname = TextEditingController();

  bool loadingAuth = false;

  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;

 
 LoanStateProvider() {
    // Call the method to load profile data when LoanStateProvider is initialized
   try {
    String? profile; 
     Preference.getProfile().then((result){
      profile = result;
   
    if (profile != null && profile is String) {
      print("printing the yoyoovalueddddd${profile}");
      Map<String, dynamic> profileData = json.decode(profile!);
      _profiledata.add(ProfileData.fromJson(profileData));
    } else {
      // Handle null or invalid profile data
      print("Profile ${_profiledata}");
    }
     });
  } catch (error) {
    // Handle error if any
    print("Error fetching profile data: $error");
  }
     PostDeposit();
  }



  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;








  PostDeposit() {
    try {
      String? postdepositData;
      Preference.getDepositeaccount().then((result) {
        postdepositData = result;

        if (postdepositData != null && postdepositData is String) {
          print("printing the poostdepositevalueddddd${postdepositData}");
           List<dynamic> postdeposoitData = json.decode(postdepositData!);
          // _PostDepositedata.add(PostDepsite.fromJson(postdeposoitData!));
        } else {
          // Handle null or invalid profile data
          print("Profile ${_PostDepositedata}");
        }
      });
    } catch (error) {
      // Handle error if any
      print("Error fetching profile data: $error");
    }
  }

  List<PostDepsite> _PostDepositedata = [];

  List<PostDepsite> get postdepsit => _PostDepositedata;


  ProfileDataProvider()  {
  try {
    String? profile; 
     Preference.getProfile().then((result){
      profile = result;
   
    if (profile != null && profile is String) {
      print("printing the valueddddd${profile}");
      Map<String, dynamic> profileData = json.decode(profile!);
      _profiledata.add(ProfileData.fromJson(profileData));
    } else {
      // Handle null or invalid profile data
      print("Profile ${_profiledata}");
    }
     });
  } catch (error) {
    // Handle error if any
    print("Error fetching profile data: $error");
  }
}

 

  depositAccount(BuildContext context) async {
    print("printing the valuee: $_profiledata");
    print("k xaxadost${ProfileDatas}");
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();

    var body = {
      "entries": [
        {
          "BRANCHCODE":
           ProfileDatas.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}",
          "ACCOUNT":
         
           ProfileDatas.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}-${accountnumber.text}",
          "CUSTID": ProfileDatas.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}-${clientid.text}",
          "DEPOSITCODE": depositecode.text,
          "tran_date_ad": trandatead.text,
          "tran_date_bs": trandatebs.text,
          "CUSTOMERNAME": name.text,
          "DEPOSIT": amount.text,
        }
      ]
    };


    String bodyJson = jsonEncode(body);
    Preference.storedepositaccount(bodyJson);
    print("printingstore postdata ${bodyJson}");
    bool online = true;
    List<Map<String, dynamic>> _getDepositeaccount = [body];

    print("collectisssonsheetbodys:${body}");
    // online = false;
    var value = await authServices.postMethod(
        ApiUrl.collectionsheet,
        jsonEncode(body),
        "73|16MKWGBV8Xctjzteu42C1f5vPn9Oyk35JzRm8q7Dd0d4fe39");
    print("tssshi body${value}");
    loadingAuth = false;

    notifyListeners();
    if (value == null) {
      loadingAuth = false;
      notifyListeners();
      Utilities.showCustomSnackBar("Login Failed !");
    } else {
      if (value["status"] == 200 || value["error"] == false) {
        _isLoggedIn = false;

        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => DepositList(),
            ),
            (route) => false,
          );
        }
        accountnumber.clear();
        clientid.clear();
        depositecode.clear();
        trandatead.clear();
        trandatebs.clear();
        amount.clear();
        depositeby.clear();
        sourceIncome.clear();
        name.clear();

        notifyListeners();
      } else {
        loadingAuth = false;
        notifyListeners();
        Utilities.showCustomSnackBar(value["message"]);
      }
    }
    loadingAuth = false;
    notifyListeners();
  }

  ///post loan collection
  loanAccount(BuildContext context) async {
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();

    var body = {
      "entries": [
        {
          "BRANCHCODE": ProfileDatas.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}",
          "ACCOUNT":
              "${ProfileDatas.first.branchCode}-${loanaccountnumber.text}",
          "CUSTID": "${ProfileDatas.first.branchCode}-${loanclientid.text}",
          "DEPOSITCODE": loandepositecode.text,
          "tran_date_ad": loantrandatead.text,
          "tran_date_bs": loantrandatebs.text,
          "CUSTOMERNAME": loanname.text,
          "DEPOSIT": loanamount.text,
        }
      ]
    };
    String bodyJson = jsonEncode(body);

    Preference.storepostloan(bodyJson);
    print("printingstore postdata ${bodyJson}");

    bool online = true;
    List<Map<String, dynamic>> _getloanaccount = [body];

    print("collectionsheetbodys:${_getloanaccount}");
    online = false;
    var value = await authServices.postMethod(
        ApiUrl.loanEntry,
        jsonEncode(body),
        "73|16MKWGBV8Xctjzteu42C1f5vPn9Oyk35JzRm8q7Dd0d4fe39");
    print("tssshi body${value}");
    loadingAuth = false;

    notifyListeners();
    if (value == null) {
      loadingAuth = false;
      notifyListeners();
      Utilities.showCustomSnackBar("Login Failed !");
    } else {
      if (value["status"] == 200) {
        _isLoggedIn = false;

        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoanList(),
            ),
            (route) => false,
          );
        }
        loanaccountnumber.clear();
        loanclientid.clear();
        loandepositecode.clear();
        loantrandatead.clear();
        loantrandatebs.clear();
        loanamount.clear();
        loandepositeby.clear();
        loansourceIncome.clear();
        loanname.clear();

        notifyListeners();
      } else {
        loadingAuth = false;
        notifyListeners();
        Utilities.showCustomSnackBar(value["message"]);
      }
    }
    loadingAuth = false;

    notifyListeners();
  }
}
