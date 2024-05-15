import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Collected extends StatefulWidget {
  const Collected({super.key});

  @override
  State<Collected> createState() => _CollectedState();
}

class _CollectedState extends State<Collected> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:200.h, left: 8.w,right: 8),
      child: Container(
        height: 160,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r),
          bottomLeft: Radius.circular(40.r),bottomRight: Radius.circular(40.r)
          ),
          color: const Color.fromARGB(255, 58, 57, 57),
        ),
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              height: 90.h,
              
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(40.r),
            
                
              ),
              child: Column(
                children: [
                  Column(children: [
                    Padding(
                                padding: EdgeInsets.only(top:25.h,left: 20.w),
                                child: Text("Today Collected ", style: TextStyle(
                                 fontSize: 14.sp,
                  
                                 color: Colors.black,
                                 fontWeight: FontWeight.w700,
                                 decoration: TextDecoration.none,
                                ),),
                              ),
                     Padding(
                                padding: EdgeInsets.only(top:10.h,left: 20.w),
                                child: Text("RS.10000.00", style: TextStyle(
                                 fontSize: 25.sp,
                  
                                 color: Colors.black,
                                 fontWeight: FontWeight.w900,
                                 decoration: TextDecoration.none,
                                ),),
                              ),
                  ],),
                  Row(children: [],)
                ],
              ),
            
            
            
            ),
            Container(
              height: 60.h,
              child: Padding(
                padding:  EdgeInsets.only(left: 30.0, top: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.more,size: 30,),
                        Text("More", style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none
                        ),)
                      ],
                    )
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}