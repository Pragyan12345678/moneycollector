import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/Deposit/DepositTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class DepositList extends StatefulWidget {
  const DepositList({super.key});

  @override
  State<DepositList> createState() => _DepositListState();
}

class _DepositListState extends State<DepositList> {
  @override
  void initState() {
    super.initState();
    // Fetch deposit accounts data during initialization
    Provider.of<DepositAccountsProvider>(context, listen: false).fetchDepositAccounts();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      
      child: Consumer<DepositAccountsProvider>(
        builder: (context, provider, _) {

          // var depositProvider = Provider.of<DepositAccountsProvider>(context); // Access the provider
    var depositAccounts = provider.depositAccounts; 
    print("k xa te ema $depositAccounts");
    
    // Access the deposit accounts data
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const CustomAppBar(
                    label: "Deposit",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                    child: Container(
                      height: 650,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: MyTable(),
                      // child: Text(" length : ${provider.depositAccounts.first.aCCOUNT?? ""}"),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
