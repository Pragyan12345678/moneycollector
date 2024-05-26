// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Collection/CustomTable.dart';
import 'package:moneycollection/Collection/editcollection.dart';
import 'package:moneycollection/Collection/table.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';

import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class Collectionsheets extends StatefulWidget {
  const Collectionsheets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CollectionsheetsState createState() => _CollectionsheetsState();
}

class _CollectionsheetsState extends State<Collectionsheets> {
   // Track the selected index

  @override
  void initState() {
    super.initState();
    // Fetch deposit accounts data during initialization
    Provider.of<DepositAccountsProvider>(context, listen: false)
        .fetchDepositAccounts();
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
                padding: const EdgeInsets.only(
                  top: 70.0,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _changePage(0);
                                },
                                child: 
                                 CustomCollectionsheet(
                                  imagePath: AppImages.saving,
                                  text: "Saving sheet",
                                                    isSelected: _currentIndex == 0, // Pass selection state

                                  
                                ),
                              ),
                               const SizedBox(
                                width: 10,
                              ),
                              
                              GestureDetector(
                                onTap: () {
                                  _changePage(1);
                                },
                                child:  CustomCollectionsheet(
                                  imagePath: AppImages.moneycollection,
                                  text: "Saving Accounts",
                                                    isSelected: _currentIndex == 1, // Pass selection state

                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePage(2);
                                },
                                child: CustomCollectionsheet(
                                  imagePath: AppImages.loan,
                                  text: "Loan sheet",
                                                    isSelected: _currentIndex == 2, // Pass selection state

                                ),
                               
                              ),
                               const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePage(3);
                                },
                                child:  CustomCollectionsheet(
                                  imagePath: AppImages.deposit,
                                  text: "Loan Account",
                                                    isSelected: _currentIndex == 3, // Pass selection state

                                ),
                              
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    IndexedStack(
                      index: _currentIndex,
                      children: const [
                        Collection(),
                        SavingAccount(),
                         LoanCollection(),
                         
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

class CustomCollectionsheet extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color selectedColor; // New property to manage selected color
  final bool isSelected;
  
  const CustomCollectionsheet({
    super.key,
    required this.imagePath,
    required this.text,
    required this.isSelected,
    this.selectedColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
       color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
                      color: isSelected ? AppColors.primaryBlue : Colors.black, // Use isSelected to determine the background color

              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected ? AppColors.primaryBlue : Colors.black, 
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),

  
    );
  }
}


class Collection extends StatelessWidget {
  const Collection({
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
                  " Saving Collection Sheet",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Table(
                border: TableBorder.lerp(
                  TableBorder.all(color: Colors.black, width: 3),
                  TableBorder.all(color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children: [
                  _buildTableRow([
                    _buildTableHeaderCell('Sn'),
                    _buildTableHeaderCell('Customer'),
                    _buildTableHeaderCell('Account'),
                    _buildTableHeaderCell('Amount'),
                    _buildTableHeaderCell('Action'),
                  ]),
                  for (int i = 0; i < loanacc.depositAccounts.length; i++)
                    _buildTableRow([
                      _buildTableCell(
                          '${loanacc.depositAccounts.first.aCCOUNT}'),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.dEPOSITTYPE}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.cUSTID}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.cUSTOMERNAME}}',
                      ),
                      TableCell(
                        child: Container(
                            // height: 30,
                            // width: 30,

                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CollectionForm(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        AppImages.edit,
                                        color: Colors.green,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        AppImages.remove,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                    ]),
                ],
              ),


              
            ],
          ),
        ),
      );
    });
  }
}


class LoanCollection extends StatelessWidget {
  const LoanCollection({
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
                  " Loan Collection Sheet",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              TableHeaderRow(),
              // Expanded(
              //   child: ListView.builder( 
              //     itemCount: loanacc.depositAccounts.length,
              //     itemBuilder: (context, index) {
              //     return TableBodyRow(
              //       sn: "1",
              //       customer: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              //       account: "${loanacc.depositAccounts[index].cUSTOMERNAME}",
              //       amount: "${loanacc.depositAccounts[index].aCCOUNT}",
              //       action: "${loanacc.depositAccounts[index].cUSTOMERNAME}"
                  
              //     );

              //   }
              //   ),
              //   ),




              Table(
                border: TableBorder.lerp(
                  TableBorder.all(color: Colors.black, width: 3),
                  TableBorder.all(color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children: [
                  _buildTableRow([
                    _buildTableHeaderCell('Sn'),
                    _buildTableHeaderCell('Customer'),
                    _buildTableHeaderCell('Account'),
                    _buildTableHeaderCell('Amount'),
                    _buildTableHeaderCell('Action'),
                  ]),
                  for (int i = 0; i < loanacc.depositAccounts.length; i++)
                    _buildTableRow([
                      _buildTableCell(
                          '${loanacc.depositAccounts.first.aCCOUNT}'),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.dEPOSITTYPE}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.cUSTID}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts.first.cUSTOMERNAME}}',
                      ),
                      TableCell(
                        child: Container(
                            // height: 30,
                            // width: 30,

                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CollectionForm(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        AppImages.edit,
                                        color: Colors.green,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        AppImages.remove,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                    ]),
                ],
              ),
            ],
          ),
        ),
      );
    });
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
                  TableBorder.all(color: Colors.black, width: 3),
                  TableBorder.all(color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children: [
                  _buildTableRow([
                    _buildTableHeaderCell('Account n0.'),
                    _buildTableHeaderCell('Account Type'),
                    _buildTableHeaderCell('Cilent Id'),
                    _buildTableHeaderCell('Full Name'),
                    _buildTableHeaderCell('Mobile no.'),
                  ]),
                  for (int i = 0; i < loanacc.depositAccounts.length; i++)
                    _buildTableRow([
                      _buildTableCell('${loanacc.depositAccounts[i].aCCOUNT}'),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].dEPOSITTYPE}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].cUSTID}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].cUSTOMERNAME}}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].mOBILE}}',
                      ),
                    ]),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
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
                  TableBorder.all(color: Colors.black, width: 3),
                  TableBorder.all(color: Colors.grey, width: 0.1),
                  1, // Interpolation value
                ),
                children: [
                  _buildTableRow([
                    _buildTableHeaderCell('Account n0.'),
                    _buildTableHeaderCell('Account Type'),
                    _buildTableHeaderCell('Cilent Id'),
                    _buildTableHeaderCell('Full Name'),
                    _buildTableHeaderCell('Mobile no.'),
                  ]),
                  for (int i = 0; i < loanacc.depositAccounts.length; i++)
                    _buildTableRow([
                      _buildTableCell('${loanacc.depositAccounts[i].aCCOUNT}'),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].dEPOSITTYPE}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].cUSTID}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].cUSTOMERNAME}',
                      ),
                      _buildTableCell(
                        '${loanacc.depositAccounts[i].mOBILE}',
                      ),
                    ]),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
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
              fontSize: 10.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    ),
  );
}

// Widget _buildTableCellAction() {
//   return TableCell(
//     child: Container(
//         // height: 30,
//         // width: 30,

//         child: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: SizedBox(
//                   height: 20,
//                   width: 20,
//                   child: Image.asset(
//                     AppImages.edit,
//                     color: Colors.green,
//                   )),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: SizedBox(
//                   height: 20,
//                   width: 20,
//                   child: Image.asset(
//                     AppImages.remove,
//                     color: Colors.red,
//                   )),
//             ),
//           ],
//         ),
//       ),
//     )),
//   );
// }

// Helper function to create a TableRow with given cells
TableRow _buildTableRow(List<Widget> cells) {
  return TableRow(
    children: cells,
  );
}
