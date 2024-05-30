import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/modules/Collection/AccountBody.dart';
import 'package:moneycollection/modules/Deposit/DepositForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class DepositData extends StatefulWidget {
  @override
  State<DepositData> createState() => _DepositDataState();
}

class _DepositDataState extends State<DepositData> {
  List<DepositAccounts> savingAccountsheet = [];

  @override
  void initState() {
    super.initState();

    _loadSavingAccountCollections();
  }

  Future<void> _loadSavingAccountCollections() async {
    List<DepositAccounts> depositcollections =
        await DatabaseHelper.instance.getAlldepositeaccount("DEPOSIT");

    setState(() {
      savingAccountsheet = depositcollections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
      return Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: savingAccountsheet.length,
          itemBuilder: (context, index) {
            return AccountTableBodyRow(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepositForm(
                            index: index,
                            accountno: "${savingAccountsheet[index].aCCOUNT}",
                            clientid: "${savingAccountsheet[index].cUSTID}",
                            depositecode:
                                "${savingAccountsheet[index].dEPOSITCODE}",
                            name: "${savingAccountsheet[index].cUSTOMERNAME}",
                          )), // Replace EditCollection with the destination page
                );
              },
              indexxx: index,
              accountno: "${savingAccountsheet[index].aCCOUNT}",
              type: "${savingAccountsheet[index].dEPOSITTYPE}",
              id: "${savingAccountsheet[index].cUSTID}",
              name: "${savingAccountsheet[index].cUSTOMERNAME}",
              mobile: "${savingAccountsheet[index].mOBILE}",
              depositcode: "${savingAccountsheet[index].dEPOSITCODE}",
            );
          },
        ),
      );
    });
  }
}
