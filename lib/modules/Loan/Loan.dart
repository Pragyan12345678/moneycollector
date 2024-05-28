import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/Nodata.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/Collection/AccountHeader.dart';
import 'package:moneycollection/recycle/DepositTable.dart';
import 'package:moneycollection/modules/Loan/LoanDataTable.dart';
import 'package:moneycollection/recycle/LoanTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class LoanList extends StatefulWidget {
  const LoanList({super.key});

  @override
  State<LoanList> createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
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
                (loanacc.depositAccountsFilteredByDeposit.isEmpty)
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 250.h,
                        ),
                        child: Nodata(),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.only(top: 70.h, right: 10, left: 10),
                        child: Container(
                          height: 650,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            children: [
                              AccountTableHeader(),
                              SizedBox(height: 500, child: LoanData()),
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
