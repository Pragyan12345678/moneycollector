// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/glonal_constant.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/modules/landingPage/bottomNav.dart';
import 'package:moneycollection/modules/splashScreen/splashscreen.dart';
import 'package:moneycollection/provider/utils/api_helper/api_base_helper.dart';

class AuthState extends ChangeNotifier {
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final TextEditingController resetEmail = TextEditingController();
  final TextEditingController newPasswordOtp = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newPasswordConfirm = TextEditingController();
  final TextEditingController registerDOB = TextEditingController();
  final TextEditingController registerPassword = TextEditingController();
  final TextEditingController registerConformPassword = TextEditingController();
  final TextEditingController registerName = TextEditingController();
  final TextEditingController registerCharge = TextEditingController();
  final TextEditingController registerEmail = TextEditingController();
  String? selectedLocation; // Add this line

  // void setSelectedLocation(String value) {
  //   selectedLocation = value;
  //   notifyListeners();
  // }

  /*------------------ edit -----------------*/
  final TextEditingController oldPasswordChange = TextEditingController();
  final TextEditingController newPasswordChange = TextEditingController();
  final TextEditingController newConformPasswordChange =
      TextEditingController();

  /*------------------ edit -----------------*/
  final TextEditingController editName = TextEditingController();
  final TextEditingController editType = TextEditingController();
  final TextEditingController editLanguage = TextEditingController();
  final TextEditingController editExperience = TextEditingController();
  String selectedImagePath = "";
  String selectedImageName = "";

  bool hidePassword = true;
  bool hideConformPassword = true;

  // AuthState() {
  //   debugPrint("this is iniit");
  //   _checkAuth();
  // }

  _checkAuth() async {
    _isLoggedIn = false;
    var viewedOnBoarding = await Preference.getOnBoarding();
    var auth = await Preference.getUser();
    var profile = await Preference.getProfile();
    var userType = await Preference.getUserType();

    debugPrint("this is profile $profile");
    if (auth != null) {
      Constant.loginToken = auth;
      if (kDebugMode) {
        debugPrint("this is Constant.loginToken ${Constant.loginToken}");
      }

      _isLoggedIn = true;

      notifyListeners();
    } else {
      notifyListeners();
    }
    if (viewedOnBoarding != null) {
      isFirstTime = viewedOnBoarding;
    }
  }

  viewedOnBoarding() {
    Preference.storeOnBoarding(false);

    notifyListeners();
  }

  void showPassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  // void showConformPassword() {
  //   hideConformPassword = !hideConformPassword;
  //   notifyListeners();
  // }
  bool isFirstTime = true;
  bool loadingAuth = false;

  loadingStop() {
    loadingAuth = false;
    notifyListeners();
  }

  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;

  login(BuildContext context) async {
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();
 
    var body = {"username": loginEmail.text, "password": loginPassword.text ,"branch" : selectedLocation,"device_name" : "ANDRIOD",};
    print("trhi body${body}");

    var value = await authServices.postMethod(ApiUrl.login, jsonEncode(body));
    print("tssshi body${value["user"]}");
    print("tssshi body${value["user"]}");
    loadingAuth = false;
    notifyListeners();
    if (value == null) {
      loadingAuth = false;
      notifyListeners();
      Utilities.showCustomSnackBar("Login Failed !");
    } else {
      if (value["status"] == 200 || value["message"]== "Logged in.") {
        print("printting thgeksdjldsvalue ${value["user"]["TOKEN"]}");
        
        _isLoggedIn = false;
         Constant.loginToken = value["user"]["TOKEN"].toString();
        Preference.storeUser(value["user"]["TOKEN"].toString());

        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        print("object");
        
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
            (route) => false,
          );
        
        notifyListeners();
      
    }
    loadingAuth = false;
    notifyListeners();
  }




  
}



}
