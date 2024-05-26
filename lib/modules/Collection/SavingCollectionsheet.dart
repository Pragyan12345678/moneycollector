import 'package:flutter/material.dart';
import 'package:moneycollection/modules/Collection/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
    return Expanded(
      child: ListView.builder(
        itemCount: loanacc.depositAccounts.length,
        itemBuilder: (context, index) {
          return TableBodyRow(
            sn: "1",
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
