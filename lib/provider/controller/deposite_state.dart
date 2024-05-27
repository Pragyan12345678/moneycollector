import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
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

  //loan
  final TextEditingController loantrandatead = TextEditingController();
  final TextEditingController loantrandatebs = TextEditingController();
  final TextEditingController loanaccountnumber = TextEditingController();
  final TextEditingController loanclientid = TextEditingController();
  final TextEditingController loanamount = TextEditingController();
  final TextEditingController loandepositecode = TextEditingController();
  final TextEditingController loandepositeby = TextEditingController();
  final TextEditingController loansourceIncome = TextEditingController();

  bool loadingAuth = false;

  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;

  LoanStateProvider() {
    // Call the method to load profile data when LoanStateProvider is initialized
    loadProfileData();
  }

  String? profileData;
  Future<void> loadProfileData() async {
    String? data = await Preference.getProfile();
    if (data != null) {
      profileData = data;
      print("thisssssssss is sprikle $profileData");
      Map<String, dynamic> profileMap = json.decode(profileData!);
      _profiledata.add(ProfileData.fromJson(profileMap));
      notifyListeners(); // Notify listeners after updating the profile data
    }
  }

  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

  depositAccount(BuildContext context) async {
    print("printing the valuee: $_profiledata");
    print("k xaxadost${ProfileDatas}");
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();

    var body = {
      "entries": [
        {
          "BRANCHCODE": ProfileDatas?.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}",
          "ACCOUNT": "${ProfileDatas.first.branchCode}-${accountnumber.text}",
          "CUSTID": "${ProfileDatas.first.branchCode}-${clientid.text}",
          // "deposit_scheme_master_code":,
          "DEPOSITCODE": depositecode.text,
          "tran_date_ad": trandatead.text,
          "tran_date_bs": trandatebs.text,
          "CUSTOMERNAME": ProfileDatas?.isEmpty ?? true
              ? ""
              : "${ProfileDatas?.first.firstName}",
          "DEPOSIT": amount.text,
        }
      ]
    };
    bool online = true;
    List<Map<String, dynamic>> _getDepositeaccount = [body];

    print("collectisssonsheetbodys:${_getDepositeaccount}");
    online = false;
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
      if (value["status"] == 200) {
        _isLoggedIn = false;
        Preference.storeUser(value["data"]["access_token"].toString());

        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        // if (context.mounted) {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const MainPage(),
        //     ),
        //     (route) => false,
        //   );
        // }
        // notifyListeners();
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
          "BRANCHCODE": ProfileDatas?.isEmpty ?? true
              ? ""
              : "${ProfileDatas.first.branchCode}",
          "ACCOUNT":
              "${ProfileDatas.first.branchCode}-${loanaccountnumber.text}",
          "CUSTID": "${ProfileDatas.first.branchCode}-${loanclientid.text}",
          "DEPOSITCODE": loandepositecode.text,
          "tran_date_ad": loantrandatead.text,
          "tran_date_bs": loantrandatebs.text,
          "CUSTOMERNAME": ProfileDatas?.isEmpty ?? true
              ? ""
              : "${ProfileDatas?.first.firstName}",
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
        Preference.storeUser(value["data"]["access_token"].toString());

        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        loantrandatebs.text = "";
        loantrandatebs.text == "";
        loanaccountnumber.text == "";
        loanamount.text == "";
        loandepositeby.text == "";
        loansourceIncome.text == "";
        // if (context.mounted) {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const MainPage(),
        //     ),
        //     (route) => false,
        //   );
        // }
        // notifyListeners();
      } else {
        loadingAuth = false;
        notifyListeners();
        Utilities.showCustomSnackBar(value["message"]);
      }
    }
    loadingAuth = false;
//     --yaha clear garda hunxa huss sir aru kehi xa?esbata hamilai loan ko pani data aauxa? loan account ko pani? Ho hamila loan account add garnu paryo vane kata add gara ho
// software ma

    notifyListeners();
  }
}
