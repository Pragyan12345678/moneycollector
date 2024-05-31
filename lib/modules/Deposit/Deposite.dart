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
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Container(
                      height: 50,
                      color: Colors.red,
                      child: Row(
                        children: [
                          Text("Branch Code: "),
                          DropdownButton<String>(
      value: selectedLocation,
      onChanged: (String? newValue) {
        setState(() {
          selectedLocation = newValue;
          
        });
      },
      items: <String>['Head Office', 'New Road']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      
      
      style: const TextStyle(
        color: Colors.black, 
        fontSize: 16, 
      ),
      
      underline: Container(
        height: 2,
        color: Colors.blue, 
      ),
    
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.blue, // Adjust icon color as needed
      ),
    ),
      //                      DropdownButtonFormField<String>(
      //               value: authController.selectedLocation,
      //               onChanged: (String? newValue) {
      //                 setState(() {
      //                  selectedLocation = newValue;
      // authController.selectedLocation = newValue; 
      //                 });
      //               },
      //               items: <String>['Head Office', 'New Road']
      //                   .map<DropdownMenuItem<String>>((String value) {
      //                 return DropdownMenuItem<String>(
      //                   value: value,
      //                   child: Text(value),
      //                 );
      //               }).toList(),
      //               decoration: InputDecoration(
      //                 labelText: 'Location',
      //                 border: OutlineInputBorder(),
      //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      //               ),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Please select a location';
      //                 }
      //                 return null;
      //               },
      //             ),
                          GestureDetector(
                        onTap: () {
                         provider.fetchDepositAccounts();
                          _refresh();

                         
                        },
                         child: Container(
                                    height: 45,
                                     width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 129, 163, 130),
                                      borderRadius: BorderRadius.circular(
                                        5),
                                       
                                     
                                    ),
                                     child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height :20,
                                          width: 20,
                                          child: Image.asset(AppImages.sync)),
                                          const Text("Sync", style: TextStyle(
                                            fontSize: 14, fontWeight:FontWeight.w500,
                                          ),)
                                          
                                      ],
                                     )
                                  ),
                       ),
                        ],
                      ),
                    ),
                  ),
                  (provider.depositAccounts.isEmpty)
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 250.h,
                        ),
                        child: const Nodata(),
                      )
                    :
                   
                  Padding(
                    padding: EdgeInsets.only(top: 90.h, right: 10, left: 10),
                    child: Container(
                      height: 650,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child:Column(
                            children: [
                             
                              AccountTableHeader(),
                              SizedBox(height: 500, child: DepositData()),
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
