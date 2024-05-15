// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
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






  // _checkAuth() async {
  //   _isLoggedIn = false;
  //   var viewedOnBoarding = await Preference.getOnBoarding();
  //   var auth = await Preference.getUser();
  //   var profile = await Preference.getProfile();
  //   var userType = await Preference.getUserType();

  //   debugPrint("this is profile $profile");
  //   if (auth != null) {
  //     Constant.loginToken = auth;
  //     if (kDebugMode) {
  //       debugPrint("this is Constant.loginToken ${Constant.loginToken}");
  //     }

  //     _isLoggedIn = true;

  //     notifyListeners();
  //   } else {
  //     notifyListeners();
  //   }
  //   if (viewedOnBoarding != null) {
  //     isFirstTime = viewedOnBoarding;
  //   }
  //   if (profile != null) {
  //     _getProfileData = ProfileModel.fromJson(json.decode(profile));
  //     Constant.currentUserID = _getProfileData!.datas!.data!.first.id!.toInt();
  //     Constant.userType = "$userType";

  //     notifyListeners();
  //   } else {}
  // }

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

  Login(BuildContext context) async {
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();

    var body = {"email": loginEmail.text, "password": loginPassword.text};
    print("trhi body${body}");
   

    var value = await authServices.postMethod(ApiUrl.login, jsonEncode(body));
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
        // _loginResponse = LoginResponseModel.fromJson(value);
        // Constant.loginToken = value["data"]["access_token"].toString();
        // Constant.userType = "1";
        // Preference.storeUserType(Constant.userType.toString());
        Preference.storeUser(value["data"]["access_token"].toString());

        await profileAstrologerController();
        loadingAuth = false;

        Utilities.showCustomSnackBar(value['message']);
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ViewSplashScreen(),
            ),
            (route) => false,
          );
        }
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

//   userLogin(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();

//     var body = {"email": loginEmail.text, "password": loginPassword.text};

//     var value =
//         await authServices.postMethod(ApiUrl.loginUser, jsonEncode(body));

//     loadingAuth = false;
//     notifyListeners();
//     if (value == null) {
//       loadingAuth = false;
//       notifyListeners();
//       Utilities.showCustomSnackBar("Login Failed !");
//     } else {
//       if (value["status"] == 200) {
//         _isLoggedIn = true;
//         Constant.loginToken = value["data"]["access_token"].toString();
//         Preference.storeUser("${value["data"]["access_token"]}");
//         Constant.userType = "0";
//         Preference.storeUserType(Constant.userType.toString());
//         await profileUserController();
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar(value['message']);
//         // Future.delayed(Duration.zero, () {
//         if (context.mounted) {
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const ViewSplashScreen(),
//             ),
//             (route) => false,
//           );
//         }
//         notifyListeners();
//       } else {
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar(value["message"]);
//       }
//     }
//     loadingAuth = false;
//     notifyListeners();
//   }

//   signOut() {
//     _isLoggedIn = false;
//     Constant.loginToken = "";
//     _getProfileData = null;
//     Preference.clearAuth();

//     notifyListeners();
//   }

  // OnBoardingModel? get onBoardingData => _getOnBoardingData;
  // OnBoardingModel? _getOnBoardingData;

  // ProfileModel? get profileData => _getProfileData;
  // ProfileModel? _getProfileData;

//   UserProfileModel? get userProfileData => _getUserProfileData;
//   UserProfileModel? _getUserProfileData;
  bool loading = false;

//   horoscopeCategoryController() async {
//     final authServices = ApiBaseHelper();
//     loading = true;
//     // notifyListeners();
//     // try {
//     final data = await authServices.getData(ApiUrl.startUp);

//     loading = false;
//     if (data != null) {
//       _getOnBoardingData = OnBoardingModel.fromJson(data);
//     }
//     // } catch (e) {
//     //   loading = false;
//     //   debugPrint("Error fetching or processing language data: $e");
//     //   notifyListeners();
//     // }

//     notifyListeners();
//   }

  profileAstrologerController() async {
  final authServices = ApiBaseHelper();
  loading = true;
  notifyListeners();

  try {
    // Modify this line to fetch data without requiring authentication
    final data = await authServices.getData(ApiUrl.login);

    loading = false;
    if (data != null) {
  //     _getProfileData = ProfileModel.fromJson(data);
  //     Constant.currentUserID = _getProfileData!.datas!.data!.first.id!;
      Preference.storeProfile(jsonEncode(data));
    }
  } catch (e) {
    loading = false;
    debugPrint("Error fetching or processing language data: $e");
    notifyListeners();
  // }

  notifyListeners();
}

//   profileUserController() async {
//     final authServices = ApiBaseHelper();
//     loading = true;
//     notifyListeners();
//     // try {
//     final data = await authServices.getDataWithToken(ApiUrl.loginProfileUser);

//     loading = false;
//     if (data != null) {
//       _getProfileData = ProfileModel.fromJson(data);
//       Constant.currentUserID = _getProfileData!.datas!.data!.first.id!;
//       Preference.storeProfile(jsonEncode(data));
//     }
//     // } catch (e) {
//     //   loading = false;
//     //   debugPrint("Error fetching or processing language data: $e");
//     //   notifyListeners();
//     // }

//     notifyListeners();
//   }

//   bool loadingSocial = false;

//   googleLogin() async {
//     // try {

//     final GoogleSignInAccount? googleUser =
//         await GoogleSignIn(scopes: ['email']).signIn();

//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleUser!.authentication;

//     String accessToken = googleSignInAuthentication.accessToken.toString();
//     loadingSocial = true;
//     notifyListeners();
//     final authServices = ApiBaseHelper();
//     var body = {
//       "name": {"en": googleUser.displayName},
//       "email": googleUser.email,
//       "provider_id": googleUser.id,
//       // "social_provider": "google",
//       // "avatar": googleUser.photoUrl,
//       // "access_token": googleSignInAuthentication.accessToken,
//     };
//     final data = await authServices.postMethod(ApiUrl.socialLogin, body);
//     debugPrint(data);
//     GoogleSignIn().disconnect();
//     // } on Exception catch (e) {
//     //   log("error is ....... $e");

//     // }
//   }

//   bool isAstrologer = true;

//   signUp(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();
//     try {
//       var body = isAstrologer == true
//           ? {
//               "name": registerName.text,
//               "email": registerEmail.text,
//               "password": registerPassword.text,
//               'password_confirmation': registerConformPassword.text,
//               'charge_per_minute': registerCharge.text,
//               'lang': Constant.lang
//             }
//           : {
//               "name": {"en": registerName.text},
//               "email": registerEmail.text,
//               "password": registerPassword.text,
//               'password_confirmation': registerConformPassword.text
//             };

//       var data = await authServices.postMethod(
//           isAstrologer == true ? ApiUrl.signUpAstro : ApiUrl.signUpCustomer,
//           jsonEncode(body));
//       loadingAuth = false;
//       notifyListeners();
//       if (data == null) {
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar("Login Failed !");
//       } else {
//         if (data["status"] == 200) {
//           loadingAuth = false;

//           Utilities.showCustomSnackBar(data['message']);

//           notifyListeners();
//         } else {
//           loadingAuth = false;
//           notifyListeners();
//           Utilities.showCustomSnackBar(data["message"]);
//         }
//       }
//       loadingAuth = false;
//       notifyListeners();
//     } catch (e) {
//       loading = false;
//       debugPrint("Error fetching or processing language data: $e");
//       notifyListeners();
//     }
//   }

//   forgetPassword(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();
//     try {
//       var body = {
//         "email": resetEmail.text,
//       };

//       var data = await authServices.postMethodWithOutContainType(
//           ApiUrl.forgetPassword, body);
//       loadingAuth = false;
//       notifyListeners();
//       if (data == null) {
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar("Failed to Process!");
//       } else {
//         Utilities.showCustomSnackBar(data['status_message']);
//         if (data["status"] == "true") {
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               AnimatedNavigation(
//                 page: const ResetPassword(),
//               ),
//             );
//           }
//           notifyListeners();
//         }
//       }
//       loadingAuth = false;
//       notifyListeners();
//     } catch (e) {
//       loading = false;
//       debugPrint("Error fetching or processing language data: $e");
//       notifyListeners();
//     }
//   }

//   resetPassword(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();
//     try {
//       var body = {
//         "email": resetEmail.text,
//         "otp": newPasswordOtp.text,
//         "new_password": newPassword.text,
//         "confirm_password": newPasswordConfirm.text,
//       };

//       debugPrint("this is body $jsonDecode(body)");
//       var data = await authServices.postMethod(ApiUrl.resetPassword, body);
//       loadingAuth = false;
//       notifyListeners();
//       if (data == null) {
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar("Failed to Process!");
//       } else {
//         Utilities.showCustomSnackBar(data['status_message']);
//         if (data["status"] == "true") {
//           if (context.mounted) {
//             Navigator.pushAndRemoveUntil(
//               context,
//               AnimatedNavigation(
//                 page: const MainPage(),
//               ),
//               (route) => false,
//             );
//           }
//           notifyListeners();
//         }
//       }
//       loadingAuth = false;
//       notifyListeners();
//     } catch (e) {
//       loading = false;
//       debugPrint("Error fetching or processing language data: $e");
//       notifyListeners();
//     }
//   }

//   changePassword(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();
//     try {
//       var body = {
//         "current_password": oldPasswordChange.text,
//         "new_password": newPasswordChange.text
//       };

//       debugPrint("this is body $jsonDecode(body)");
//       var data =
//           await authServices.postMethodWithAuth(ApiUrl.resetPassword, body);
//       loadingAuth = false;
//       notifyListeners();
//       if (data == null) {
//         loadingAuth = false;
//         notifyListeners();
//         Utilities.showCustomSnackBar("Failed to Process!");
//       } else {
//         Utilities.showCustomSnackBar(data['status']);
//         if (data["status"] == "true") {
//           if (context.mounted) {
//             Navigator.pushAndRemoveUntil(
//               context,
//               AnimatedNavigation(
//                 page: const MainPage(),
//               ),
//               (route) => false,
//             );
//           }
//           notifyListeners();
//         }
//       }
//       loadingAuth = false;
//       notifyListeners();
//     } catch (e) {
//       loading = false;
//       debugPrint("Error fetching or processing language data: $e");
//       notifyListeners();
//     }
//   }

//   editProfile(BuildContext context) async {
//     final authServices = ApiBaseHelper();

//     loadingAuth = true;
//     notifyListeners();
//     try {
//       var body = {
//         // "id": Constant.currentUserID,
//         "name": {"en": editName.text},
//         "language": editLanguage.text.toString(),
//         "experience": editExperience.text.toString(),
//         "email": "${profileData?.datas?.data?.first.email}"
//         // "photo": "http://192.168.1.107:8000/storage/uploads/users/${selectedImageName}"
//       };
//       debugPrint("this is body : ${jsonEncode(body)}");
//       // debugPrint("this is body $jsonEncode(body)");
//       var data = await authServices.multiParseWithToken(
//           "${ApiUrl.editProfile}/${Constant.currentUserID}",
//           body,
//           selectedImagePath);
//       loadingAuth = false;
//       notifyListeners();
//       debugPrint("this is response: $data");
//       // if (data == null) {
//       //   loadingAuth = false;
//       //   notifyListeners();
//       //   Utilities.showCustomSnackBar("Failed to Process!");
//       // } else {
//       //   Utilities.showCustomSnackBar(data['status_message']);
//       //   if (data["status"] == "true") {
//       //     Navigator.pushAndRemoveUntil(context,
//       //         AnimatedNavigation(page: const MainPage()), (route) => false);
//       //     notifyListeners();
//       //   }
//       // }
//       // loadingAuth = false;
//       // notifyListeners();
//     } catch (e) {
//       loading = false;
//       debugPrint("Error fetching or processing language data: $e");
//       notifyListeners();
//     }
//   }

// // Future<void> _loginWithFacebook() async {
// //   final LoginResult accessToken = await FacebookAuth.instance.login();
// //
// //   if (accessToken != null) {
// //     final AuthCredential facebookAuthCredential =
// //     FacebookAuthProvider.getCredential(accessToken.token);
// //
// //     final ParseUser user =
// //     await ParseUser.loginWith(facebookAuthCredential);
// //
// //     if (user != null) {
// //       // Facebook authentication successful
// //       // Proceed with user registration or login
// //     } else {
// //       // Handle user registration or login failure
// //     }
// //   } else {
// //     // Handle Facebook authentication failure
// //   }
// // }
}
}
