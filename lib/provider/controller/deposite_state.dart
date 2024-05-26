import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/provider/service/services.dart';

class LoanStateProvider with ChangeNotifier {


  final TextEditingController trandatead = TextEditingController();
  final TextEditingController trandatebs = TextEditingController();
  final TextEditingController accountnumber = TextEditingController();
  final TextEditingController amount = TextEditingController();
   final TextEditingController depositeby = TextEditingController();
  final TextEditingController sourceIncome = TextEditingController();

  bool loadingAuth = false;
  
  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;

  ProfileDataProvider()  {
  var profile =  Preference.getProfile();
  print("yoyo${profile}"); // Wait for the future to complete
  _profiledata.add(ProfileData.fromJson(profile));
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
      "branch_code": ProfileDatas?.isEmpty ?? true ? "" : "${ProfileDatas!.first.branchCode}-",
      "customer_account_uid":accountnumber.text,
      "customer_uid":ProfileDatas?.isEmpty ?? true ? "": "${ProfileDatas?.first.uid}",
      // "deposit_scheme_master_code":,
      "tran_date_ad":trandatead.text,
      "tran_date_bs":trandatebs.text ,
      "customer_name":ProfileDatas?.isEmpty ?? true ?"": "${ProfileDatas?.first.firstName}",
      "deposit_amount":amount.text,

 
     };
       List<Map<String, dynamic>> _getDepositeaccount = [body];
bool online =true;
    print("collectionsheetbodys:${body}");

    var value = await authServices.postMethod(ApiUrl.collectionsheet, jsonEncode(body));
    print("tssshi body${value}");
    loadingAuth = false;
    online = false;
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

}