// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:moneycollection/constant/CustomAppbar.dart';
// import 'package:moneycollection/constant/colors.dart';
// import 'package:moneycollection/constant/image.dart';
// import 'package:moneycollection/modules/Deposit/DepositTable.dart';
// import 'package:moneycollection/modules/dashboard/dashboard.dart';

// class CollectionHome extends StatefulWidget {
//   @override
//   _CollectionHomeState createState() => _CollectionHomeState();
// }

// class _CollectionHomeState extends State<CollectionHome> {
//   String _selectedPage = 'Savings';

//   void _selectPage(String page) {
//     setState(() {
//       _selectedPage = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: AppColors.greyColor,
//           body: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Container(
//                   height: 120.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(5.r),
//                         bottomRight: Radius.circular(5.r)),
//                     color: AppColors.primaryBlue,
//                   ),
//                 ),
//                 const CustomAppBar(
//                   label: "Collection Sheet",
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 70.0,
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.white),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               GestureDetector(
//                                   onTap: () => _selectPage('Savings'),
//                                   child: Dashboardbalance(
//                                       imagePath: AppImages.deposit,
//                                       text: "Saving")),
//                               GestureDetector(
//                                   onTap: () => _selectPage('Loan'),
//                                   child: Dashboardbalance(
//                                       imagePath: AppImages.deposit,
//                                       text: "Loan")),
//                               GestureDetector(
//                                   onTap: () => _selectPage('Collection Data'),
//                                   child: Dashboardbalance(
//                                       imagePath: AppImages.deposit,
//                                       text: "Sync Data")),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 200.0, left: 10, right: 10),
//                   child: Expanded(
//                     child: _selectedPage == 'Savings'
//                         ? Container(
//                             alignment: Alignment.center,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.white,
//                               ),
//                               width: double.infinity,
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Saving Accounts",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           color: Colors.grey,
//                                           decoration: TextDecoration.none,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                   Table(
//                                     border: TableBorder.lerp(
//                                       TableBorder.all(
//                                           color: Colors.black, width: 3),
//                                       TableBorder.all(
//                                           color: Colors.grey, width: 0.1),
//                                       1, // Interpolation value
//                                     ),
//                                     children: const [
//                                       TableRow(
//                                         children: [
//                                           TitleCell(
//                                             label: 'Account no.',
//                                           ),
//                                           TitleCell(
//                                             label: 'Account Type',
//                                           ),
//                                           TitleCell(
//                                             label: 'Client ID',
//                                           ),
//                                           TitleCell(
//                                             label: 'Full Name',
//                                           ),
//                                           TitleCell(
//                                             label: 'Mobile no.',
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         : Container(
//                             color: Colors.red,
//                             width: double.infinity,
//                             child: Column(
//                               children: [
//                                 Text('Loan'),
//                               ],
//                             ),
//                           ),
//                   ),
//                 )
//               ],
//             ),
//           )

//           //  Column(
//           //   children: [
//           //     Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       children: [
//           //         ElevatedButton(
//           //           onPressed: () => _selectPage('Savings'),
//           //           child:   Dashboardbalance(
//           //                             imagePath: AppImages.deposit,
//           //                             text: "Saving ",

//           //                           ),
//           //         ),
//           //         ElevatedButton(
//           //           onPressed: () => _selectPage('Loan'),
//           //           child:  Dashboardbalance(
//           //                             imagePath: AppImages.deposit,
//           //                             text: "Loan ",

//           //                           ),
//           //         ),
//           //       ],
//           //     ),
//           //     SizedBox(
//           //       height: 20.h,
//           //     ),
//           //     Expanded(
//           //       child: _selectedPage == 'Savings'
//           //           ? Container(
//           //               alignment: Alignment.center,
//           //               child: Container(
//           //                 color: Colors.black,
//           //                 width: double.infinity,
//           //                 child: Column(children: [
//           //                   Text('Saving Accounts'),
//           //                 ],)
//           //                 ,

//           //               ),
//           //             )
//           //           : Container(
//           //                 color: Colors.red,
//           //                 width: double.infinity,
//           //                 child: Column(children: [
//           //                   Text('Saving Accounts'),
//           //                 ],)
//           //                 ,

//           //               ),
//           //             )

//           //   ],
//           // ),
//           ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Collection/Collection.dart';
import 'package:moneycollection/modules/Deposit/DepositTable.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class Collectionsheets extends StatefulWidget {
  @override
  _CollectionsheetsState createState() => _CollectionsheetsState();
}

class _CollectionsheetsState extends State<Collectionsheets> {

    @override
  void initState() {
    super.initState();
    // Fetch deposit accounts data during initialization
    Provider.of<DepositAccountsProvider>(context, listen: false).fetchDepositAccounts();
    
  }
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  ),
                  color: AppColors.primaryBlue,
                ),
                
              ),
               const CustomAppBar(
                  label: "Collection Sheet",
                ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0,left: 10, right: 10,),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _changePage(0);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              // color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                              child: const Dashboardbalance(
                                imagePath: AppImages.moneycollection,
                                text: "Collection ",
                               
                                
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _changePage(1);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              // color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                              child: const Dashboardbalance(
                                imagePath: AppImages.moneycollection,
                                text: "Saving",
                                
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _changePage(2);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              // color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                              child: const Dashboardbalance(
                                imagePath: AppImages.moneycollection,
                                text: "Loan",
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    IndexedStack(
                      index: _currentIndex,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Collection Sheet",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.grey,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Table(
                                    border: TableBorder.lerp(
                                      TableBorder.all(
                                          color: Colors.black, width: 3),
                                      TableBorder.all(
                                          color: Colors.grey, width: 0.1),
                                      1, // Interpolation value
                                    ),
                                    children:  [
                                      TableRow(
                                        children: [
                                          TitleCell(
                                            label: 'SN',
                                          ),
                                          TitleCell(
                                            label: 'Customer',
                                          ),
                                          TitleCell(
                                            label: 'Amount',
                                          ),
                                          TitleCell(
                                            label: 'Actions',
                                          ),
                                         
                                        ],
                                        
                                      ),
                                      


                                      
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SavingAccount(),
                        LoanAccount(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavingAccount extends StatelessWidget {
  const SavingAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
         
                 print('Length of depositAccounts: ${loanacc.depositAccounts.length}');

    return Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Saving Accounts",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Table(
                border: TableBorder.lerp(
                  TableBorder.all(
                      color: Colors.black, width: 3),
                  TableBorder.all(
                      color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children:  [
                  _buildTableRow([
              _buildTableHeaderCell('Account n0.'),
              _buildTableHeaderCell('Account Type'),
              _buildTableHeaderCell('Cilent Id'),
              _buildTableHeaderCell('Full Name'),
              _buildTableHeaderCell('Mobile no.'),
            ]),
            for (int i = 0;
                i < loanacc.depositAccounts.length;
                i++)
              _buildTableRow([
                _buildTableCell(
                    '${loanacc.depositAccounts.first.aCCOUNT }'),
                _buildTableCell(
                  '${loanacc.depositAccounts.first.dEPOSITTYPE}}',
                ),
                _buildTableCell(
                   '${loanacc.depositAccounts.first.cUSTID}}',),
                     _buildTableCell(
                   '${loanacc.depositAccounts.first.cUSTOMERNAME}}',),
                     _buildTableCell(
                   '${loanacc.depositAccounts.first.mOBILE}}',),
              ]),
                ],
              ),
            ],
          ),
        ),
      );
  }
      );}
}

class LoanAccount extends StatelessWidget {
  const LoanAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Loan Accounts",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Table(
                border: TableBorder.lerp(
                  TableBorder.all(
                      color: Colors.black, width: 3),
                  TableBorder.all(
                      color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children:  [
                  _buildTableRow([
              _buildTableHeaderCell('Account n0.'),
              _buildTableHeaderCell('Account Type'),
              _buildTableHeaderCell('Cilent Id'),
              _buildTableHeaderCell('Full Name'),
              _buildTableHeaderCell('Mobile no.'),
            ]),
            for (int i = 0;
                i < loanacc.depositAccounts.length;
                i++)
              _buildTableRow([
                _buildTableCell(
                    '${loanacc.depositAccounts.first.aCCOUNT }'),
                _buildTableCell(
                  '${loanacc.depositAccounts.first.dEPOSITTYPE}}',
                ),
                _buildTableCell(
                   '${loanacc.depositAccounts.first.cUSTID}}',),
                     _buildTableCell(
                   '${loanacc.depositAccounts.first.cUSTOMERNAME}}',),
                     _buildTableCell(
                   '${loanacc.depositAccounts.first.mOBILE}}',),
              ]),
                ],
              ),
            ],
          ),
        ),
      );
  }
    );}
}

Widget _buildTableHeaderCell(String text) {
  return TableCell(
    child: Container(
      padding: EdgeInsets.all(12.0),
      // color: Colors.blueAccent,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

// Helper function to create a styled TableCell
Widget _buildTableCell(String text) {
  return TableCell(
    child: Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}

// Helper function to create a TableRow with given cells
TableRow _buildTableRow(List<Widget> cells) {
  return TableRow(
    children: cells,
  );
}
  
      // Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             _changePage(0);
      //           },
      //           child: Container(
      //             padding: EdgeInsets.all(10),
      //             color: _currentIndex == 0 ? Colors.blue : Colors.grey,
      //             child: Text('Page 1', style: TextStyle(color: Colors.white)),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             _changePage(1);
      //           },
      //           child: Container(
      //             padding: EdgeInsets.all(10),
      //             color: _currentIndex == 1 ? Colors.blue : Colors.grey,
      //             child: Text('Page 2', style: TextStyle(color: Colors.white)),
      //           ),
      // //         ),
      // //         GestureDetector(
      // //           onTap: () {
      // //             _changePage(2);
      // //           },
      // //           child: Container(
      // //             padding: EdgeInsets.all(10),
      // //             color: _currentIndex == 2 ? Colors.blue : Colors.grey,
      // //             child: Text('Page 3', style: TextStyle(color: Colors.white)),
      // //           ),
      //         ),
      //       ],
      //     ),
      //     Expanded(
      //       child: IndexedStack(
      //         index: _currentIndex,
      //         children: [
      //           Container(
      //             color: Colors.red,
      //             child: Center(
      //               child: Text('Content of Page 1', style: TextStyle(color: Colors.white, fontSize: 20)),
      //             ),
      //           ),
      //           Container(
      //             color: Colors.green,
      //             child: Center(
      //               child: Text('Content of Page 2', style: TextStyle(color: Colors.white, fontSize: 20)),
      //             ),
      //           ),
      //           Container(
      //             color: Colors.orange,
      //             child: Center(
      //               child: Text('Content of Page 3', style: TextStyle(color: Colors.white, fontSize: 20)),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),