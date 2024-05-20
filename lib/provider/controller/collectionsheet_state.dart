import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/provider/service/services.dart';

class CollectionState with ChangeNotifier {


   final TextEditingController trandatead = TextEditingController();
  final TextEditingController trandatebs = TextEditingController();
  final TextEditingController accountnumber = TextEditingController();
  final TextEditingController amount = TextEditingController();

  bool loadingAuth = false;
  
  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;


Login(BuildContext context) async {
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();
 
    var body = {
      // "branch_code":,
      "customer_account_uid":accountnumber.text,
      // "customer_uid":,
      // "deposit_scheme_master_code":,
      "tran_date_ad":trandatead.text,
      "tran_date_bs":trandatebs.text ,
      // "customer_name":,
      "deposit_amount":amount.text,

 
     };

    print("collectionsheetbodys:${body}");

    var value = await authServices.postMethod(ApiUrl.collectionsheet, jsonEncode(body));
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

}