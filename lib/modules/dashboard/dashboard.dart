import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Deposit/Deposite.dart';
import 'package:moneycollection/modules/Loan/Loan.dart';
import 'package:moneycollection/modules/Statement/statement.dart';

import 'package:moneycollection/modules/Collection/Collection.dart';
import 'package:moneycollection/modules/profile/profile.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isContentVisible = false;

  void toggleContentVisibility() {
    setState(() {
      isContentVisible = !isContentVisible;
    });
  }

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
              const DashboardAppBAr(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(
                          left: 10.w, right: 20.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 190.h,
                        width: double.infinity,
                        color: AppColors.greyColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 74.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5).r,
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Collected Balance",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        isContentVisible
                                            ? FirstContent()
                                            : SecondContent(),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(isContentVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: toggleContentVisibility,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Dashboardbalance(
                                  imagePath: AppImages.moneycollection,
                                  text: "Collection",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Deposite()),
                                    );
                                  },
                                ),
                                // const SizedBox(
                                //   width: 10,
                                // ),
                                // Dashboardbalance(
                                //   imagePath: AppImages.statement,
                                //   text: "Statement",
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => const Statement()),
                                //     );
                                //   },
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Dashboardbalance(
                                  imagePath: AppImages.deposit,
                                  text: "Deposit",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const DepositList()),
                                    );
                                  },
                                ),
                               
                                const SizedBox(
                                  width: 10,
                                ),
                                 Dashboardbalance(
                                  imagePath: AppImages.loan,
                                  text: "Loan",
                                  onTap: () {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoanList()),
                                    );
                                  },
                                ),
                                
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 280),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.greyColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: (){
Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Statement()),
                                    );

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "View All",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                    color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 12,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Recent Transactions",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        "Recent Transactions",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "NPR. 70000",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(
                                                    AppImages.more,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Divider(
                                              color: Colors.grey, thickness: 1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Repeat similar structure for other items
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 12,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Recent Transactions",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        "Recent Transactions",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "NPR. 70000",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(
                                                    AppImages.more,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Divider(
                                              color: Colors.grey, thickness: 1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Repeat similar structure for other items
                                ],
                              ),
                            ),
                          ],
                        ),
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

class Dashboardbalance extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;
  const Dashboardbalance({
    required this.imagePath,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                  color: AppColors.primaryColor,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardAppBAr extends StatelessWidget {
  const DashboardAppBAr({
    super.key,
  });
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5.0.w, right: 40.w),
      child: Container(
        color: Colors.transparent,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profileview()),
                );
              },
              child: SizedBox( // Wrap GestureDetector with SizedBox
                width: 60.w,
                child:  CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.person, size: 30, color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Welcome,",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Pragyan Maharjan",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  AppImages.notification,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstContent extends StatelessWidget {
  const FirstContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        "Rs.10,000",
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        "Rs.xxxxx",
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryBlue,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
