import 'package:flutter/material.dart';
import 'package:moneycollection/Model/PostLoan.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class SavingCollection extends StatelessWidget {
   String? postLoanData;



// LoanStateProvider() {
//     // Call the method to load profile data when LoanStateProvider is initialized
//     loadPostLoanData();
//   }

//   String? profileData;
//   Future<void> loadPostLoanData() async {
//     String? data = await Preference.getPostloan();
//     if (data != null) {
//       postLoanData = data;
//       print("thisssssssss is sprikle $profileData");
//       Map<String, dynamic> profileMap = json.decode(postLoanData!);
//       _postloan.add(PostLoan.fromJson(profileMap));
//       notifyListeners(); // Notify listeners after updating the profile data
//     }
//   }
  

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
    return Container(
      constraints: BoxConstraints.expand(), 
        child: ListView.builder(
          itemCount:
           loanacc.depositAccounts.length,
          itemBuilder: (context, index) {
            return TableBodyRow(
              indexxx:index,
         
              sn: "${index + 1}",
              customer: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              account: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              amount: "${loanacc.depositAccounts[index].aCCOUNT}",
              action: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
            );
          },
        ),
      
    );
  }
   );
  }
}
