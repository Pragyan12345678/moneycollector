import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';

import 'package:moneycollection/constant/user_sharepreference.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class Loancoll extends StatefulWidget {
   final void Function() navigatetoloancollection;

  const Loancoll({super.key, required this.navigatetoloancollection});
  @override
  State<Loancoll> createState() => _LoancollState();
}

class _LoancollState extends State<Loancoll> {
    
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
          return TableBodyRow(
             navigatetoloancollection: widget.navigatetoloancollection,
              indexxx:index,
              sn: "${index + 1}",
               customer: "${loancollectionsheet[index].cUSTOMERNAME}",
               account: "${loancollectionsheet[index].aCCOUNT}",
               amount: "${loancollectionsheet[index].dEPOSIT}",
               isSaving: false,
               datead: "${loancollectionsheet[index].tranDateAd}",
               datebs: "${loancollectionsheet[index].tranDateBs}",
               
              
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
