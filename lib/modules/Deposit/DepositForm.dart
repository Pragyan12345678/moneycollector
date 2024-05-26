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

class DepositForm extends StatefulWidget {
  final Map<String, String> datas;
 

  const DepositForm({Key? key, required this.datas}) : super(key: key);

  @override
  State<DepositForm> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
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
                  label: "Deposit Form",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                  child: Container(
                    height: 650.h,
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
                            controller: loan.trandatebs,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CalenderField(
                            label: " Tran Date(Ad)",
                            useNepaliCalendar: false,
                            controller: loan.trandatead,
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
                              controller: loan.accountnumber),
                          const SizedBox(height: 10),
                          FormCustomTextField(
                            "0.00",
                            label: "Amount",
                            controller: loan.amount,
                          ),
                          const SizedBox(height: 20),
                          FormCustomTextField(
                            "",
                            label: "Deposite By",
                            controller: loan.depositeby,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormCustomTextField(
                            "",
                            label: "Source of Income",
                            controller: loan.sourceIncome,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 100.w, right: 100.w),
                            child: GestureDetector(
                              onTap: () {
                                String tranad = loan.trandatead.text;
                                String tranbs = loan.trandatebs.text;
                                String accountno = loan.accountnumber.text;
                                String amount = loan.amount.text;
                                String depositby = loan.depositeby.text;
                                String sourceIncome = loan.sourceIncome.text;

                                print('tranad: $tranad');
                                print('tranbs: $tranbs');
                                print('tranad: $accountno');
                                print('tranbs: $amount');
                                print('tranad: $depositby');
                                print('tranbs: $sourceIncome');

                                if (tranad.isNotEmpty ||
                                    tranbs.isNotEmpty ||
                                    accountno.isNotEmpty ||
                                    amount.isNotEmpty ||
                                    depositby.isNotEmpty ||
                                    sourceIncome.isNotEmpty) {
                                  loan.trandatebs.text = "";
                                  loan.trandatebs.text == "";
                                  loan.accountnumber.text == "";
                                  loan.amount.text == "";
                                  loan.depositeby.text == "";
                                  loan.sourceIncome.text == "";
                                  loan.depositAccount(context);
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
