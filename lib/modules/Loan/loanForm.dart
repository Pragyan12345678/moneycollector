import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/StoreDeposite.dart';
import 'package:moneycollection/constant/AccountTexfield.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/FormField.dart';
import 'package:moneycollection/constant/both.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:provider/provider.dart';

class LoanForm extends StatefulWidget {
  // final Map<String, String> datas;
 

  const LoanForm({Key? key, 
  // required this.datas
  }) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
//   late SharedPreferences sp;
//     late Future<void> _initSPFuture; // Future for initializing SharedPreferences
//  // Define SharedPreferences instance here
//   List<DepositeEntries> depositentries = [];
  
//   @override
//   void initState() {
//     super.initState();
//     getSharedPrefernce();
//     ReadFromspDeposite(); // Call function to initialize SharedPreferences
//   }

//    getSharedPrefernce()async {
//       sp = await SharedPreferences.getInstance();
//    }

// saveIntoSpDeposit(){
// List<String> depsitentriesListString= depositentries.map((depositentrie) => jsonEncode(depositentrie.toJson())).toList();
//  sp.setStringList( 'mydata', depsitentriesListString);
// }



// ReadFromspDeposite(){
//  List<String> ? depsitentriesListString = sp.getStringList("mydata");
//  if (depsitentriesListString!= null){
//   depositentries =depsitentriesListString.map((depositentrie) => DepositeEntries.fromJson(jsonDecode(depositentrie))).toList();
//  }
//  setState(() {
   
//  });

// }





   
  @override
  Widget build(BuildContext context) {
    int selectedIndex = -1;
    return Consumer<LoanStateProvider>(builder: (context, loan, child) {
      return Consumer<ProfileDataProvider>(builder: (context, profile, child) {
        var profiledetails = profile.ProfileDatas;
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r)),
                    color: AppColors.primaryBlue,
                  ),
                ),
                const CustomAppBar(
                  label: "Loan Collection Form",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                  child: Container(
                    // height: 650.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CalenderField(
                            label: " Tran Date(Bs)",
                            useNepaliCalendar: true,
                            controller: loan.loantrandatebs,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CalenderField(
                            label: " Tran Date(Ad)",
                            useNepaliCalendar: false,
                            controller: loan.loantrandatead,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Account Number",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AccountTextField(
                              label:
                                  '${profiledetails.isNotEmpty ? profiledetails.first.branchCode ?? "" : ""}-',
                              controller: loan.loanaccountnumber),
                          const SizedBox(height: 10),
                          Text(
                            "Client ID",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AccountTextField(
                              label:
                                  '${profiledetails.isNotEmpty ? profiledetails.first.branchCode ?? "" : ""}-',
                              controller: loan.loanclientid),
                          const SizedBox(height: 10),
                          FormCustomTextField(
                            "0.00",
                            label: "Amount",
                            controller: loan.loanamount,
                          ),
                          const SizedBox(height: 20),
                          FormCustomTextField(
                            "",
                            label: "Deposite Code",
                            controller: loan.loandepositecode,
                          ),
                          FormCustomTextField(
                            "",
                            label: "Deposite By",
                            controller: loan.loandepositeby,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormCustomTextField(
                            "",
                            label: "Source of Income",
                            controller: loan.loansourceIncome,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 100.w, right: 100.w),
                            child: GestureDetector(
                              onTap: () {
                                String tranad = loan.loantrandatead.text;
                                String tranbs = loan.loantrandatebs.text;
                                String accountno = loan.loanaccountnumber.text;
                                String clientid = loan.loanclientid.text;
                                String amount = loan.loanamount.text;
                                String depositcode = loan.loandepositecode.text;
                                String depositby = loan.loandepositeby.text;
                                String sourceIncome = loan.loansourceIncome.text;

                                print('tranad: $tranad');
                                print('tranbs: $tranbs');
                                print('account: $accountno');
                                  print('account: $clientid');
                                     print('account: $depositcode');
                                print('amount: $amount');
                                print('deposit: $depositby');
                                print('sourceicome: $sourceIncome');

                                if (tranad.isNotEmpty ||
                                    tranbs.isNotEmpty ||
                                    accountno.isNotEmpty ||
                                    clientid.isNotEmpty ||
                                    amount.isNotEmpty ||
                                    depositcode.isNotEmpty ||
                                    depositby.isNotEmpty ||
                                    sourceIncome.isNotEmpty) {
                                  // loan.loantrandatebs.text = "";
                                  // loan.loantrandatebs.text == ""; kina value clear? submit garya paxi clear garnu parna Add ma clear garnu parne ho?  add garya pxai 
                                  // loan.loanaccountnumber.text == "";
                                  // loan.loanamount.text == "";
                                  // loan.loandepositeby.text == "";
                                  // loan.loansourceIncome.text == "";
                                  loan.loanAccount(context);
                                  // depositentries.add(DepositeEntries(tranad: tranad,tranbs: tranbs,accountno: accountno,amount: amount, depositby: depositby,sourceIncome: sourceIncome));
                                  // ReadFromspDeposite();





                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.primaryBlue,
                                ),
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      });
    });
   
  }
}
