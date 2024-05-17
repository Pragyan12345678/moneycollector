import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/Deposit/DepositTable.dart';
import 'package:moneycollection/modules/Loan/LoanTable.dart';

class LoanList extends StatefulWidget {
  const LoanList({super.key});

  @override
  State<LoanList> createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              
              Container(
                    
                    height: 120.h,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                    
        
                  ),
                   const CustomAppBar(
                    label: "Loan",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                    child: Container(
                      height: 650,
                      decoration:BoxDecoration(
                        
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                        
                    
                    
                      ),
                      child: LoanTable(),
        
                  
                    ),
                  )
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}