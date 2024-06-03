import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/Nodata.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Collection/AccountHeader.dart';

import 'package:moneycollection/modules/Loan/LoanDataTable.dart';

import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class LoanList extends StatefulWidget {
  const LoanList({super.key});

  @override
  State<LoanList> createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  
    Future<void> _refresh() async {
    // Fetch deposit accounts data
    await Provider.of<DepositAccountsProvider>(context, listen: false).fetchDepositAccounts();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
         
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
                  label: "Loan",
                ),
                 Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 290),
                    child: GestureDetector(
                                        onTap: () {
                                         loanacc.fetchDepositAccounts();
                    _refresh();
                                  
                                         
                                        },
                                         child: Container(
                              height: 45,
                               width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 129, 163, 130),
                                borderRadius: BorderRadius.circular(
                                  10),
                                 
                               
                              ),
                               child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height :20,
                                    width: 20,
                                    child: Image.asset(AppImages.sync)),
                                    const Text("Sync", style: TextStyle(
                                      fontSize: 14, fontWeight:FontWeight.w500,
                                    ),)
                                    
                                ],
                               )
                            ),
                                       ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 90.h, right: 10.w, left: 10.w),
                  child: Container(
                    height: 650.h,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        AccountTableHeader(),
                        (loanacc.depositAccounts.isEmpty)
                            ? Padding(
                                padding: EdgeInsets.only(
                                  top: 150.h,
                                ),
                                child: const Nodata(),
                              )
                            : SizedBox(height: 580.h, child: LoanData()),
                        // LoanTable()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
