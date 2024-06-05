// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/constant/Nodata.dart';
import 'package:moneycollection/modules/Collection/AccountHeader.dart';
import 'package:moneycollection/modules/Collection/SavingCollectionsheet.dart';
import 'package:moneycollection/modules/Collection/loancollection.dart';
import 'package:moneycollection/modules/Collection/table.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Deposit/DepositeDataTable.dart';
import 'package:moneycollection/modules/Loan/LoanDataTable.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/modules/landingPage/bottomNav.dart';

import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';

class Collectionsheets extends StatefulWidget {
  const Collectionsheets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CollectionsheetsState createState() => _CollectionsheetsState();
}

class _CollectionsheetsState extends State<Collectionsheets> {
  List<Entries> savingCollections = [];
  List<Entries> loanCollections = [];
  List<DepositAccounts> accountDepositCollections = [];
  List<DepositAccounts> accountLoanCollections = [];
  // Track the selected index

  @override
  void initState() {
    super.initState();

    Provider.of<DepositAccountsProvider>(context, listen: false);

    _loadSavingCollections();
    _loadDepositAccountCollections();
    _loadLoanAccountCollections();
    _loadLoanCollections();
  }

  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _loadSavingCollections() async {
    List<Entries> collections =
        await DatabaseHelper.instance.getAllgetsavingcollection();
    setState(() {
      savingCollections = collections;
    });
  }

void navigateToLoancollection() {
  setState(() {
    _currentIndex = 2; // Index of the Loan Account page
  });
}
void navigateTosavingcollection() {
  setState(() {
    _currentIndex = 0; // Index of the Loan Account page
  });
}

  Future<void> _loadLoanCollections() async {
    List<Entries> loancollections =
        await DatabaseHelper.instance.getAllgetloancollection();
    setState(() {
      loanCollections = loancollections;
    });
  }

  Future<void> _loadDepositAccountCollections() async {
    List<DepositAccounts> depositaccountcollections =
        await DatabaseHelper.instance.getAlldepositeaccount("DEPOSIT");
    setState(() {
      accountDepositCollections = depositaccountcollections;
    });
  }

  Future<void> _loadLoanAccountCollections() async {
    List<DepositAccounts> loanaccountcollections =
        await DatabaseHelper.instance.getAlldepositeaccount("LOAN");
    setState(() {
      accountLoanCollections = loanaccountcollections;
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardHome()),
                            );
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
                          "Collection sheet", // Correcting string interpolation
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 52.0,
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
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 10, right: 10, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _changePage(0);
                                  _loadSavingCollections();
                                },
                                child: CustomCollectionsheet(
                                  imagePath: AppImages.saving,
                                  text: "Saving sheet",
                                  isSelected: _currentIndex ==
                                      0, // Pass selection state
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePage(1);
                                },
                                child: CustomCollectionsheet(
                                  imagePath: AppImages.moneycollection,
                                  text: "Saving Accounts",
                                  isSelected: _currentIndex ==
                                      1, // Pass selection state
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePage(2);
                                  _loadLoanCollections();
                                },
                                child: CustomCollectionsheet(
                                  imagePath: AppImages.loan,
                                  text: "Loan sheet",
                                  isSelected: _currentIndex ==
                                      2, // Pass selection state
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePage(3);
                                },
                                child: CustomCollectionsheet(
                                  imagePath: AppImages.deposit,
                                  text: "Loan Account",
                                  isSelected: _currentIndex ==
                                      3, // Pass selection state
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildPageBasedOnIndex(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageBasedOnIndex() {
    switch (_currentIndex) {
      case 0:
        return Collection(
          savingCollections: savingCollections,
           navigatetosavingcollection: navigateTosavingcollection,
        );
      case 1:
        return SavingAccount(
          depositaccountcollections: accountDepositCollections,
        );
      case 2:
        return LoanCollection(loanCollects: loanCollections,
         navigatetoloancollection: navigateToLoancollection
        );
      case 3:
        return LoanAccount(
          loanaccountcollections: accountLoanCollections,
          navigatetoloancollection: navigateToLoancollection
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class CustomCollectionsheet extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color selectedColor;
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
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
              color: isSelected
                  ? AppColors.primaryBlue
                  : Colors
                      .black, // Use isSelected to determine the background color

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
     final void Function() navigatetosavingcollection;
  final List<Entries> savingCollections;
  const Collection({
    super.key,
    required this.savingCollections, required this.navigatetosavingcollection,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
      
        builder: (context, loanacc, child) {
          print(navigatetosavingcollection);
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
              Row(
                children: [
                  
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 20),
                      child: Center(
                        child: Text(
                          " Saving Collection Sheet",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400),
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
                            builder: (BuildContext context) {
                              return Consumer<LoanStateProvider>(builder: (context, loan, child) {
                              return AlertDialog(
                                title: const Text("Confirm Deletion"),
                                content: const Text(
                                    "Are you sure you want to Sync the  Saving Collection?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                       loan.depositAccount(context);  
                                      
                                    },
                                    child: const Text("Sync"),
                                  ),
                                ],
                              );
                              });
                            },
                          ); 
                               },
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   height: 20.h,
                                                      
                                   width: 20.h,
                                   color: Colors.white,
                                   child:Image.asset(AppImages.sync,color: Colors.grey,)
                                 ),
                               ),
                             ),
                   ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "Saving Collection Sheet",
              //     style: TextStyle(
              //         fontSize: 16.sp,
              //         color: Colors.grey,
              //         decoration: TextDecoration.none,
              //         fontWeight: FontWeight.w400),
              //   ),
              // ),
              savingCollections.isEmpty
                  ? const Nodata()
                  : Column(
                      children: [
                        
                  
                        TableHeaderRow(),
                        SizedBox(height: 425.h, child: SavingCollection(
 navigatetosavingcollection:navigatetosavingcollection,
                          
                        )),
                        
                      ],
                    )
            ],
          ),
        ),
      );
    });
  }
}

class LoanCollection extends StatelessWidget {
  final List<Entries> loanCollects;
   final void Function() navigatetoloancollection;
  const LoanCollection({
    super.key,
    required this.loanCollects, required this.navigatetoloancollection,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
          return Consumer<LoanStateProvider>(
        builder: (context, acc, child) {
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
              Row(
                children: [
                  
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 20),
                      child: Center(
                        child: Text(
                          " Loan Collection Sheet",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400),
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
                            builder: (BuildContext context) {
                              return Consumer<LoanStateProvider>(builder: (context, loan, child) {
                              return AlertDialog(
                                title: const Text("Confirm Deletion"),
                                content: const Text(
                                    "Are you sure you want to Sync the Collection?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                       loan.loanAccount(context);  
                                      
                                    },
                                    child: const Text("Sync"),
                                  ),
                                ],
                              );
                              });
                            },
                          ); 
                               },
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   height: 20.h,
                                                      
                                   width: 20.h,
                                   color: Colors.white,
                                   child:Image.asset(AppImages.sync,color: Colors.grey,)
                                 ),
                               ),
                             ),
                   ),
                ],
              ),
              loanCollects.isEmpty
                  ? const Nodata()
                  : Column(
                      children: [
                        TableHeaderRow(),
                        SizedBox(height: 425.h, child: Loancoll(
                           navigatetoloancollection: navigatetoloancollection

                        )),
                      ],
                    )
            ],
          ),
        ),
      );
    });
    });
  }
}

class SavingAccount extends StatelessWidget {
  final List<DepositAccounts> depositaccountcollections;
  const SavingAccount({
    super.key,
    this.depositaccountcollections = const [],
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
                  "Saving Accounts",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              depositaccountcollections.isEmpty
                  ? const Nodata()
                  : Column(
                      children: [
                        AccountTableHeader(),
                        SizedBox(height: 425.h, child: DepositData()),
                      ],
                    )
            ],
          ),
        ),
      );
    });
  }
}

class LoanAccount extends StatelessWidget {
  final List<DepositAccounts> loanaccountcollections;
   final void Function() navigatetoloancollection;
  const LoanAccount({
    super.key,
    required this.loanaccountcollections, required this.navigatetoloancollection,
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Loan Accounts",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
              ),
              loanaccountcollections.isEmpty
                  ? const Nodata()
                  : Column(
                      children: [
                        AccountTableHeader(),
                        SizedBox(height: 425.h, child: LoanData(

                        //  navigatetoloancollection: navigatetoloancollection
                        )),
                      ],
                    )
            ],
          ),
        ),
      );
    });
  }
}
