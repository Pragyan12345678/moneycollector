import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/image.dart';

class TranactionHistory extends StatefulWidget {
  const TranactionHistory({super.key});

  @override
  State<TranactionHistory> createState() => _TranactionHistoryState();
}

class _TranactionHistoryState extends State<TranactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 380.0,),
      child: Container(
        width: double.infinity,
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r)
          ),
          color: Colors.white
        ),
        child: Column(children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.h, left: 15.w,right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction history",style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600, color: Colors.black, decoration: TextDecoration.none
                ),),
                Text("View all",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.green, decoration: TextDecoration.none
                ),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 15.h, left:10.w, right: 10.w),
            child: SingleChildScrollView(
              child: Container(
                height: 65.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 221, 221),
                  borderRadius: BorderRadius.circular(20.r)
              
              
              
              
              
              
              
              
              
                ),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    
                      
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(AppImages.man)
                        
                      ),
                  
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:  EdgeInsets.only( top: 15.h, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text("Recevied from Pragyan ",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, decoration: TextDecoration.none
                      ),),
                      SizedBox(height: 5.h,),
                         Text("14:30 PM",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, decoration: TextDecoration.none
                      ),),
                       
                        ],
                      ),
                    ),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.only(right: 15.0),
                   child: Text("RS.200",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green, decoration: TextDecoration.none
                      ),),
                 ),
                  
                  
                ],),
                
              ),
            ),
          ),
           Padding(
            padding:  EdgeInsets.only(top: 15.h, left:10.w, right: 10.w),
            child: SingleChildScrollView(
              child: Container(
                height: 65.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 221, 221),
                  borderRadius: BorderRadius.circular(20.r)
              
              
              
              
              
              
              
              
              
                ),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    
                      
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(AppImages.man)
                        
                      ),
                  
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:  EdgeInsets.only( top: 15.h, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text("Recevied from Pragyan ",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, decoration: TextDecoration.none
                      ),),
                      SizedBox(height: 5.h,),
                         Text("14:30 PM",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, decoration: TextDecoration.none
                      ),),
                       
                        ],
                      ),
                    ),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.only(right: 15.0),
                   child: Text("RS.200",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green, decoration: TextDecoration.none
                      ),),
                 ),
                  
                  
                ],),
                
              ),
            ),
          ),
           Padding(
            padding:  EdgeInsets.only(top: 15.h, left:10.w, right: 10.w),
            child: SingleChildScrollView(
              child: Container(
                height: 65.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 221, 221),
                  borderRadius: BorderRadius.circular(20.r)
              
              
              
              
              
              
              
              
              
                ),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    
                      
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(AppImages.man)
                        
                      ),
                  
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:  EdgeInsets.only( top: 15.h, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text("Recevied from Pragyan ",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, decoration: TextDecoration.none
                      ),),
                      SizedBox(height: 5.h,),
                         Text("14:30 PM",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, decoration: TextDecoration.none
                      ),),
                       
                        ],
                      ),
                    ),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.only(right: 15.0),
                   child: Text("RS.200",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green, decoration: TextDecoration.none
                      ),),
                 ),
                  
                  
                ],),
                
              ),
            ),
          ),
           Padding(
            padding:  EdgeInsets.only(top: 15.h, left:10.w, right: 10.w),
            child: SingleChildScrollView(
              child: Container(
                height: 65.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 221, 221),
                  borderRadius: BorderRadius.circular(20.r)
              
              
              
              
              
              
              
              
              
                ),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    
                      
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(AppImages.man)
                        
                      ),
                  
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:  EdgeInsets.only( top: 15.h, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text("Recevied from Pragyan ",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, decoration: TextDecoration.none
                      ),),
                      SizedBox(height: 5.h,),
                         Text("14:30 PM",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, decoration: TextDecoration.none
                      ),),
                       
                        ],
                      ),
                    ),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.only(right: 15.0),
                   child: Text("RS.200",style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green, decoration: TextDecoration.none
                      ),),
                 ),
                  
                  
                ],),
                
              ),
            ),
          ),
          
        ],),
      ),
    );
  }
}