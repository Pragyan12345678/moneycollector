import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/Model/Profile.dart';
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/modules/Collection/Collectionhome.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';

import 'package:moneycollection/provider/service/Dbservices.dart';
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
  final TextEditingController accountnumberadd = TextEditingController();
  final TextEditingController clientidadd = TextEditingController();
  final TextEditingController updateamount = TextEditingController();

  final TextEditingController updateloanamount = TextEditingController();

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
  final TextEditingController loanbranch = TextEditingController();

  final TextEditingController loanaccountnumberadd = TextEditingController();
  final TextEditingController loanclientidadd = TextEditingController();

  bool loadingAuth = false;

  bool? get isAuthenticated => _isLoggedIn;
  bool _isLoggedIn = false;
  final ProfileDataProvider _profileDataProvider = ProfileDataProvider();

  LoanStateProvider() {
    _profileDataProvider.loadProfileData();
    initializeprofiledata();
  }

  Future<void> initializeprofiledata() async {
    try {
      String? profile;
      Preference.getProfile().then((result) {
        profile = result;

        if (profile != null && profile is String) {
          print(
              "Deposit state: Profile get data from preference ssss ${profile}");
          Map<String, dynamic> profileData = json.decode(profile!);
          _profiledata.add(ProfileData.fromJson(profileData));
        } else {
         
        }
      });
    } catch (error) {
      print("Error fetching profile data: $error");
    }
  }

  List<Entries> savingCollections = [];
  Future<void> loadSavingCollections() async {
    List<Entries> collections =
        await DatabaseHelper.instance.getAllgetsavingcollection();

    savingCollections = collections;
    notifyListeners();
  }

  List<Entries> loancollectionsheet = [];
  Future<void> loadLoanCollections() async {
    List<Entries> loancollections =
        await DatabaseHelper.instance.getAllgetloancollection();

    loancollectionsheet = loancollections;
  }

  List<ProfileData> _profiledata = [];

  List<ProfileData> get ProfileDatas => _profiledata;

  Future<void> databasedeposit(BuildContext context) async {

    loadingAuth = true;
    notifyListeners();
    List<Map<String, dynamic>> entriesList = [];

    var body = {
      "BRANCHCODE": branch.text,
      "ACCOUNT": accountnumberadd.text,
      "CUSTID": clientidadd.text,
      "DEPOSITCODE": depositecode.text,
      "tran_date_ad": trandatead.text,
      "tran_date_bs": trandatebs.text,
      "CUSTOMERNAME": name.text,
      "DEPOSIT": amount.text,
    };
    var entry = Entries.fromJson(body);
    var result = await DatabaseHelper.instance.newsavingcollection(entry);

    if (result == -1) {
      // Duplicate entry
      Utilities.showCustomSnackBar("Duplicate entry");
      loadingAuth = false;
      notifyListeners();
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Collectionsheets(
              index: 0,
            ),
          ),
          (route) => false,
        );
      }
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
      Utilities.showCustomSnackBar("Successfully  Added");
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Collectionsheets(
              index: 0,
            ),
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
    }
    entriesList.add(body);
  }

  Future<void> databaseloan(BuildContext context) async {

    loadingAuth = true;
    notifyListeners();
    List<Map<String, dynamic>> entriesList = [];

    var body = {
      "BRANCHCODE": loanbranch.text,
      "ACCOUNT": loanaccountnumberadd.text,
      "CUSTID": loanclientidadd.text,
      "DEPOSITCODE": loandepositecode.text,
      "tran_date_ad": loantrandatead.text,
      "tran_date_bs": loantrandatebs.text,
      "CUSTOMERNAME": loanname.text,
      "DEPOSIT": loanamount.text,
    };
    var entry = Entries.fromJson(body);
    var result = await DatabaseHelper.instance.newloancollection(entry);

    if (result == -1) {
      // Duplicate entry
      Utilities.showCustomSnackBar("Duplicate entry");
      loadingAuth = false;
      notifyListeners();
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Collectionsheets(
              index: 2,
            ),
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
      Utilities.showCustomSnackBar("Successfully  Added Loan ");

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Collectionsheets(
              index: 2,
            ),
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
    }

    entriesList.add(body);
  }

  Future<void> depositAccount(BuildContext context) async {
    final authServices = ApiBaseHelper();

    DatabaseHelper dbHelper = DatabaseHelper.instance;

    loadingAuth = true;
    notifyListeners();
    List<Entries> values = await dbHelper.getAllgetsavingcollection();
    

    var data = {"entries": values};

    // String bodyJson = jsonEncode(body);
    // Preference.storedepositaccount(bodyJson);
    print("printingstore postdata ${data}");

    var token = await Preference.getUser();

    var value = await authServices.postMethod(
        ApiUrl.collectionsheet, jsonEncode(data), "$token");

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
        for (Entries entry in values) {
          await dbHelper.deletesavingcollection(entry.aCCOUNT ?? '');
        }
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Collectionsheets(
                index: 0,
              ),
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
        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const Collectionsheets(
              index: 0,
            ),
          ),
          (route) => false,
        );
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
  Future<void> loanAccount(BuildContext context) async {
    final authServices = ApiBaseHelper();
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    loadingAuth = true;
    notifyListeners();
    List<Entries> loanvalues = await dbHelper.getAllgetloancollection();
    var data = {"entries": loanvalues};

    var token = await Preference.getUser();

    var value = await authServices.postMethod(
        ApiUrl.loanEntry, jsonEncode(data), "$token");

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
        for (Entries entry in loanvalues) {
          await dbHelper.deleteloancollection(entry.aCCOUNT ?? '');
        }
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Collectionsheets(
                index: 2,
              ),
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
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => const Collectionsheets(
          index: 2,
        ),
      ),
      (route) => false,
    );
    notifyListeners();
  }
}
