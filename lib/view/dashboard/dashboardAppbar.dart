
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/image.dart';

class DashboardAppbar extends StatefulWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();
}

class _DashboardAppbarState extends State<DashboardAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 8.w, right: 8.w),
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage(AppImages.man)
            ),
          ),
          
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Column(
              
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pragyan Maharjan",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 30.h, ),
            child: IconButton(
              icon: const Icon(Icons.notifications,size: 30,color: Colors.white,), // Notification icon
              onPressed: () {
                // Add onPressed action for notification icon
              },
            ),
          )
        ],
      ),
    );
  }
}