import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
              const CustomAppBar(label: "Notification"),
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Listofnotification(
                        title: "Transaction Alert",
                        content: "123564564564513s,admljbndasndlkjadkhasldknlkasdhnlksandlkjsahdlkhsdasd",
                        date: "May 10, 2024 at 125:22 PM",
                      ),
                       Listofnotification(
                        title: "Transaction Alert",
                        content: "123564564564513s,admljbndasndlkjadkhasldknlkasdhnlksandlkjsahdlkhsdasd",
                        date: "May 10, 2024 at 125:22 PM",
                      ),
                       Listofnotification(
                        title: "Transaction Alert",
                        content: "123564564564513s,admljbndasndlkjadkhasldknlkasdhnlksandlkjsahdlkhsdasd",
                        date: "May 10, 2024 at 125:22 PM",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Listofnotification extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const Listofnotification({
    required this.title,
    required this.content,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.orange,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 320.w, //
                    color: Colors.white,
                    child: Text(
                      content,
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: AppColors.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3, // Adjust as needed
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(date, style: TextStyle(
                    color: Colors.grey
                  ),)
                ],
              ),
            ],
          ),
        ),
        Divider(
        thickness: 1,
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
    
        )
      ],
    );
  }
}
