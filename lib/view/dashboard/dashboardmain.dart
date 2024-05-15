import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/view/dashboard/collected.dart';

import 'package:moneycollection/view/dashboard/dashboardAppbar.dart';
import 'package:moneycollection/view/dashboard/dashhboardtotal.dart';
import 'package:moneycollection/view/dashboard/transactionhistory.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black,
      child: SingleChildScrollView(
        
        child: Stack(
         
            children: [
              Column(
                children: [
                  Container(
                   
                    height: 170.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r)
                      ) ,
                       color: Colors.black
                    ),
                  ),
                  // DashboardAppbar()
                ],
              ),
             
              const DashboardAppbar(),
              const DashboardTotalAmount(),
              Collected(),
              TranactionHistory()
              
          //     Padding(
          //       padding: 
          //        EdgeInsets.only(top: 250.h,left: 8.w,right: 8.w),
          //       child: Container(
                  
          //         height: 500.h,
          //         decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20.r),
          // color: Colors.white,
          // boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.5), // Shadow color
          //       spreadRadius: 5, // Spread radius
          //       blurRadius: 7, // Blur radius
          //       offset: Offset(0, 3), // Offset
          //     ),
          //   ],
          
          // ),
                
                
          //       ),
          //     )
            ],
          ),
        
      
      ),
    );
  }
}

