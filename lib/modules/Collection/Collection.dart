import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AccountTexfield.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/FormField.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/provider/controller/collectionsheet_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:provider/provider.dart';

class Deposite extends StatefulWidget {
  const Deposite({super.key});

  @override
  State<Deposite> createState() => _DepositeState();
}

class _DepositeState extends State<Deposite> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionState>(builder: (context, collectionn, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r))),
                ),
                const CustomAppBar(
                  label: "Collection Sheet",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                  child: Container(
                    height: 500.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           FormCustomTextField(
                            "2022-10-22",
                            controller: collectionn.trandatead,
                            label: "Tran Date(AD)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           FormCustomTextField("2072-1-2",
                              controller: collectionn.trandatead,
                              label: "Tran Date(BS)"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Account Number",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 10),
                          AccountTextField(),
                          const SizedBox(height: 10),
                           FormCustomTextField(
                            "0.00",
                            label: "Amount",
                            controller: collectionn.amount,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 100.w, right: 100.w),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => const MainPage()),
                                // );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.primaryBlue,
                                ),
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
