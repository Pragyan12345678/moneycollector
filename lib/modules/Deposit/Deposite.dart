import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/Nodata.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Collection/AccountHeader.dart';
import 'package:moneycollection/modules/Deposit/DepositeDataTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:provider/provider.dart';

class DepositList extends StatefulWidget {
  const DepositList({super.key});

  @override
  State<DepositList> createState() => _DepositListState();
}

class _DepositListState extends State<DepositList> {
  Future<void> _refresh() async {
    // Fetch deposit accounts data
    await Provider.of<DepositAccountsProvider>(context, listen: false)
        .fetchDepositAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthState>(
        builder: (context, authController, child) {
          return Consumer<DepositAccountsProvider>(
            builder: (context, provider, _) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: 170.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)),
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Deposit", // Correcting string interpolation
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      (provider.depositAccounts.isEmpty)
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: 252.h,
                              ),
                              child: const Nodata(),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                  top: 70.h, right: 10.w, left: 10.w),
                              child: Container(
                                height: 690.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15,
                                                left: 20),
                                            child: Center(
                                              child: Text(
                                                " Deposite Account",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.grey,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Confirm Syncing"),
                                                    content: const Text(
                                                        "Are you sure you want to Sync the Collection?"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Cancel"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          provider
                                                              .fetchDepositAccounts();
                                                          _refresh();
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                            // ignore: use_build_context_synchronously
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const DepositList(),
                                                            ),
                                                            (route) => false,
                                                          );
                                                        },
                                                        child:
                                                            const Text("Sync"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  height: 20.h,
                                                  width: 20.h,
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                    AppImages.sync,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AccountTableHeader(),
                                    SizedBox(
                                        height: 580.h, child: DepositData()),
                                    // LoanTable()),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
