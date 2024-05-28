import 'package:flutter/material.dart';
import 'package:moneycollection/Model/PostLoan.dart';
import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/AccountBody.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/modules/Deposit/DepositForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class DepositData extends StatelessWidget {


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
            return AccountTableBodyRow(
              ontap: () {
                       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DepositForm(
       index: index,
      accountno: "${loanacc.depositAccounts[index].aCCOUNT}",
      clientid: "${loanacc.depositAccounts[index].cUSTID}",
      depositecode: "${loanacc.depositAccounts[index].dEPOSITCODE}",
       name: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
     


      )), // Replace EditCollection with the destination page
    );
              },
              indexxx:index,
              accountno: "${loanacc.depositAccounts[index].aCCOUNT}",
              type: "${loanacc.depositAccounts[index].dEPOSITTYPE}",
              id: "${loanacc.depositAccounts[index].cUSTID}",
              name: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              mobile: "${loanacc.depositAccounts[index].mOBILE}",
        depositcode: "${loanacc.depositAccounts[index].dEPOSITCODE}",




            );
          },
        ),
      
    );
  }
   );
  }
}
