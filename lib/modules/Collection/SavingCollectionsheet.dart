import 'package:flutter/material.dart';
import 'package:moneycollection/Model/Postdeposite.dart';

import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class SavingCollection extends StatefulWidget {
  @override
  State<SavingCollection> createState() => _SavingCollectionState();
}

class _SavingCollectionState extends State<SavingCollection> {
    List<Entries> savingCollections = [];
   String? postLoanData;

  @override
  void initState() {
    super.initState();

    _loadSavingCollections();
  }
    Future<void> _loadSavingCollections() async {
      
    List<Entries> collections = await DatabaseHelper.instance.getAllgetsavingcollection();
    setState(() {
      savingCollections = collections;
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
           savingCollections.length ,
          itemBuilder: (context, index) {
         
            return TableBodyRow(
              
              indexxx:index+1,
         
              sn: "${index + 1}",
               customer: "${savingCollections[index].cUSTOMERNAME}",
               account: "${savingCollections[index].aCCOUNT}",
               amount: "${savingCollections[index].dEPOSIT}",
                datead: "${savingCollections[index].tranDateAd}",
                 datebs: "${savingCollections[index].tranDateBs}",

               isSaving: true,
               
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
