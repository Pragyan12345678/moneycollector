import 'package:flutter/material.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/modules/Collection/AccountBody.dart';
import 'package:moneycollection/modules/Loan/loanForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class LoanData extends StatefulWidget {
  @override
  State<LoanData> createState() => _LoanDataState();
}

class _LoanDataState extends State<LoanData> {
  String? postLoanData;

  List<DepositAccounts> loanAccountsheet = [];

  @override
  void initState() {
    super.initState();

    _loadLoanAccountCollections();
  }

  Future<void> _loadLoanAccountCollections() async {
    List<DepositAccounts> loancollections =
        await DatabaseHelper.instance.getAlldepositeaccount("LOAN");

    setState(() {
      loanAccountsheet = loancollections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
      return Container(
        constraints: const BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: loanAccountsheet.length,
          itemBuilder: (context, index) {
            return AccountTableBodyRow(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoanForm(
                            index: index,
                            accountno: "${loanAccountsheet[index].aCCOUNT}",
                            clientid: "${loanAccountsheet[index].cUSTID}",
                            depositecode:
                                "${loanAccountsheet[index].dEPOSITCODE}",
                            name: "${loanAccountsheet[index].cUSTOMERNAME}",
                          )),
                );
              },
              indexxx: index+1,
              accountno: "${loanAccountsheet[index].aCCOUNT}",
              type: "${loanAccountsheet[index].dEPOSITTYPE}",
              id: "${loanAccountsheet[index].cUSTID}",
              name: "${loanAccountsheet[index].cUSTOMERNAME}",
              mobile: "${loanAccountsheet[index].mOBILE}",
              depositcode: "${loanAccountsheet[index].dEPOSITCODE}",
            );
          },
        ),
      );
    });
  }
}