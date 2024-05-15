import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardTotalAmount extends StatefulWidget {
  const DashboardTotalAmount({
    super.key,
  });

  @override
  State<DashboardTotalAmount> createState() => _DashboardTotalAmountState();
}

class _DashboardTotalAmountState extends State<DashboardTotalAmount>with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(top: 120.0,),
        child: Container(
          
          height: 50.h,
          width: 200.w,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: const Color.fromARGB(255, 199, 197, 197),
          boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: Offset(0, 3), // Offset
              ),
            ],
          
          ),
          child: Row(
            children: [
              Container(
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),
                  
                  bottomLeft: Radius.circular(20.r), ),
                  color: Colors.red,
                ),
                
                
                child: Center(
                  child: Text(" Collect", style: TextStyle(
                     fontSize: 12.sp,
                     fontWeight: FontWeight.w600,
                     color: Colors.black,
                     decoration: TextDecoration.none,
                    ),),
                ),
              ),
              Container(
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),
                  
                  bottomRight: Radius.circular(20.r), ),
                  color: Colors.white,
                ),
                
                
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Form", style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w600,
                       color: Colors.black,
                       decoration: TextDecoration.none,
                      ),),
                  ),
                ),
      //              deco
              )
            ],
          ),
          
          
          
     
        ),
      ),
    );
  }
}

 //         child: Padding(
      //           padding:  EdgeInsets.only(top: 1.h, left: 20.w),
      //           child: Column(
      //              crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //  Text("You Collect", style: TextStyle(
      //              fontSize: 14.sp,
      //              fontWeight: FontWeight.w600,
      //              color: Colors.black,
      //              decoration: TextDecoration.none,
      //             ),),
      //              IconButton(
      //       onPressed: () {
      //         // Add onPressed action for the menu icon
      //       },
      //       icon: Icon(Icons.menu), // Add the menu icon here
      //     ),
      //                 ],
      //               ),
      
             
      //             SizedBox(
      //               height: 8.h,
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(top:8.h,left: 20.w),
      //               child: Text("Rs.10,000", style: TextStyle(
      //                fontSize: 30.sp,
      
      //                color: Colors.black,
      //                fontWeight: FontWeight.w700,
      //                decoration: TextDecoration.none,
      //               ),),
      //             ),
            
      //           ],),
      //         ),