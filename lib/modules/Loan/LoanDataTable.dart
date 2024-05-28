import 'package:flutter/material.dart';
import 'package:moneycollection/Model/PostLoan.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/AccountBody.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/modules/Loan/loanForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class LoanData extends StatelessWidget {
   String? postLoanData;



  

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
    return Container(
      constraints: BoxConstraints.expand(), 
        child: ListView.builder(
          itemCount:
           loanacc.depositAccountsFilteredByDeposit.length,
          itemBuilder: (context, index) {
            return AccountTableBodyRow(
              ontap: (){
                Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanForm(
        index: index,
      accountno: "${loanacc.depositAccountsFilteredByDeposit[index].aCCOUNT}",
      clientid: "${loanacc.depositAccountsFilteredByDeposit[index].cUSTID}",
      depositecode: "${loanacc.depositAccountsFilteredByDeposit[index].dEPOSITCODE}",
      name: "${loanacc.depositAccountsFilteredByDeposit[index].cUSTOMERNAME}",
     



      )), // Replace EditCollection with the destination page
    );

              },

              indexxx:index,
              accountno: "${loanacc.depositAccountsFilteredByDeposit[index].aCCOUNT}",
              type: "${loanacc.depositAccountsFilteredByDeposit[index].dEPOSITTYPE}",
              id: "${loanacc.depositAccountsFilteredByDeposit[index].cUSTID}",
              name: "${loanacc.depositAccountsFilteredByDeposit[index].cUSTOMERNAME}",
              mobile: "${loanacc.depositAccountsFilteredByDeposit[index].mOBILE}",
              depositcode: "${loanacc.depositAccountsFilteredByDeposit[index].dEPOSITCODE}",


            );
          },
        ),
      
    );
  }
   );
  }
}
