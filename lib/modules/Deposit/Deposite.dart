import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/Deposit/DepositTable.dart';

class DepositList extends StatefulWidget {
  const DepositList({super.key});

  @override
  State<DepositList> createState() => _DepositListState();
}

class _DepositListState extends State<DepositList> {
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
                    label: "Deposit",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                    child: Container(
                      height: 650,
                      decoration:BoxDecoration(
                        
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                        
                    
                    
                      ),
                      child: MyTable(),
        
                  
                    ),
                  )
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}