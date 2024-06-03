import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
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
    await Provider.of<DepositAccountsProvider>(context, listen: false).fetchDepositAccounts();
  }

  @override
  Widget build(BuildContext context) {
     
    return SafeArea(
      child: Consumer<AuthState>(builder: (context, authController, child) {
      return Consumer<DepositAccountsProvider>(
        builder: (context, provider, _) {

          // var depositProvider = Provider.of<DepositAccountsProvider>(context); // Access the provider
    var depositAccounts = provider.depositAccounts; 
    String? selectedLocation;

   
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 170.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const CustomAppBar(
                    label: "Deposit",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 260, right: 10),
                    child: GestureDetector(
                                        onTap: () {
                                         provider.fetchDepositAccounts();
                    _refresh();
                                  
                                         
                                        },
                                         child: Container(
                              height: 40.h,
                              //  width: 130.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 154, 204, 157),
                                borderRadius: BorderRadius.circular(
                                  10.r),
                                 
                               
                              ),
                               child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      height :20.h,
                                      width: 20.w,
                                      child: Image.asset(AppImages.sync)),
                                  ),
                                     SizedBox(
                                      width: 1.w,
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.only(right: 8.0),
                                       child: Text("Sync", style: TextStyle(
                                        fontSize: 14.sp, fontWeight:FontWeight.w500,
                                                                           ),),
                                     )
                                    
                                ],
                               )
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
                    :
                   
                  Padding(
                    padding: EdgeInsets.only(top: 90.h, right: 10.w, left: 10.w),
                    child: Container(
                      height: 650.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child:Column(
                            children: [
                             
                              AccountTableHeader(),
                              SizedBox(height: 580.h, child: DepositData()),
                              // LoanTable()),
                            ],
                          ),
                      // child: Text(" length : ${provider.depositAccounts.first.aCCOUNT?? ""}"),
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
