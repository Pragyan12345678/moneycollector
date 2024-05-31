import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';

import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class LoanCollection extends StatefulWidget {
  @override
  State<LoanCollection> createState() => _LoanCollectionState();
}

class _LoanCollectionState extends State<LoanCollection> {
    
   String? postLoanData;

     List<Entries> loancollectionsheet = [];


    @override
  void initState() {
    super.initState();

    _loadLoanCollections();
  }
    Future<void> _loadLoanCollections() async {
      
    List<Entries> loancollections = await DatabaseHelper.instance.getAllgetloancollection();
    
    setState(() {
      loancollectionsheet = loancollections;
    });
  }


// LoanStateProvider() {
  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
          return Consumer<LoanStateProvider>(
        builder: (context, postdeposite, child) {
    return Container(
      constraints: BoxConstraints.expand(), 
        child: ListView.builder(
          itemCount:
           loancollectionsheet.length ,
          itemBuilder: (context, index) {
            // print("print postcollection  ${postdeposite.postdepsit[index].entries!.first.cUSTOMERNAME}",);
            return TableBodyRow(
              indexxx:index,
         
              sn: "${index + 1}",
               customer: "${loancollectionsheet[index].cUSTOMERNAME}",
               account: "${loancollectionsheet[index].aCCOUNT}",
               amount: "${loancollectionsheet[index].dEPOSIT}",
               isSaving: false,
               datead: "${loancollectionsheet[index].tranDateAd}",
               datebs: "${loancollectionsheet[index].tranDateBs}",
               
              // customer: "${loanacc.depositAccounts.depos}",
              // customer: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              // account: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              // amount: "${loanacc.depositAccounts[index].aCCOUNT}",
              // action: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
            );
          },
        ),
      
    );
  }
   );
  }
  );
  }
}
