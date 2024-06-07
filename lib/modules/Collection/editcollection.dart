import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/constant/AccountTexfield.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/FormField.dart';
import 'package:moneycollection/constant/both.dart';

import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/modules/Collection/Collectionhome.dart';

import 'package:moneycollection/provider/controller/Profile_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';
import 'package:provider/provider.dart';
class EditCollectionForm extends StatefulWidget {
  final int inde;
  final String datead;
  final String datebs;
  final String account;
  final String amount;
    final bool isSaving;
     final void  Function()? navigatetoloancollection;
     final void  Function()? navigatetosavingcollection;

  const EditCollectionForm({
    Key? key,
    required this.inde,
    required this.datead,
    required this.datebs,
    required this.account,
    required this.amount, required this.isSaving, 
     this.navigatetoloancollection,
     this.navigatetosavingcollection
  }) : super(key: key);

  @override
  State<EditCollectionForm> createState() => _EditCollectionFormState(
        datead: datead,
        datebs: datebs,
        account: account,
        amount: amount,
      );
}
void Function()? navigatetosavingcollection;
void Function()? navigatetoloancollection;

class _EditCollectionFormState extends State<EditCollectionForm> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoanStateProvider>(context, listen: false);

    _loadSavingCollections();

    _loadLoanCollections();
    
    
  }
  late TextEditingController trandateadController;
  late TextEditingController trandatebsController;
  late TextEditingController accountnumberController;
  late TextEditingController amountController;

  _EditCollectionFormState({
    required String datead,
    required String datebs,
    required String account,
    required String amount,
  }) {
    trandateadController = TextEditingController(text: datead);
    trandatebsController = TextEditingController(text: datebs);
    accountnumberController = TextEditingController(
    text: account.length >= 7 ? account.substring(7) : "Invalid Account");
    amountController = TextEditingController(text: amount);
  }

    List<Entries> savingCollections = [];
    List<Entries> loanCollections = [];

  // Track the selected index

  

  int _currentIndex = 0;

  void _changePage(int index) {
    
      _currentIndex = index;

  }

  Future<void> _loadSavingCollections() async {
    List<Entries> collections =
        await DatabaseHelper.instance.getAllgetsavingcollection();
 
      savingCollections = collections;
 
  }
  Future<void> _loadLoanCollections() async {
    List<Entries> loancollections =
        await DatabaseHelper.instance.getAllgetloancollection();

      loanCollections = loancollections;
 
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDataProvider>(
      builder: (context, profile, child) {
        var profiledetails = profile.ProfileDatas;
        DatabaseHelper databaseHelper = DatabaseHelper.instance;

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
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                  ),
                  const CustomAppBar(
                    label: " Edit Collection Sheet",
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
                            offset: const Offset(
                              0,
                              2,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Consumer<LoanStateProvider>(
                        builder: (context, collectionn, child) {
                          // Initialize text fields with widget's data


                          if(widget.isSaving == true){
                            collectionn.trandatead.text =
                              trandateadController.text;
                          collectionn.trandatebs.text =
                              trandatebsController.text;
                          collectionn.accountnumber.text =
                              accountnumberController.text;
                          collectionn.amount.text = amountController.text;
                          }else{
                            collectionn.loantrandatead.text =
                              trandateadController.text;
                          collectionn.loantrandatebs.text =
                              trandatebsController.text;
                          collectionn.loanaccountnumber.text =
                              accountnumberController.text;
                          collectionn.loanamount.text = amountController.text;
                          }
                    

                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CalenderField(
                                  label: " Tran Date(Bs)",
                                  useNepaliCalendar: true,
                                  controller: 
                                  (widget.isSaving == true)?
                                  collectionn.trandatebs
                                  :  collectionn.loantrandatebs
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CalenderField(
                                  label: " Tran Date(Ad)",
                                  useNepaliCalendar: false,

                                  controller:  (widget.isSaving == true)?
                                  collectionn.trandatead
                                  :collectionn.loantrandatead
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Account Number",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                AccountTextField(
                                  label:
                                      '${profiledetails.isNotEmpty ? profiledetails.first.branchCode ?? "" : ""}-',
                                  controller:  (widget.isSaving == true)?
                                  collectionn.accountnumber
                                  :collectionn.loanaccountnumber
                                ),
                                const SizedBox(height: 10),
                                FormCustomTextField(
                                  "0.00",
                                  label: "Amount",
                                   textInputType: TextInputType.number,
                                  controller: 
                                    (widget.isSaving == true)?
                                  collectionn.updateamount
                                  :collectionn.updateloanamount
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 100.w,
                                    right: 100.w,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {

if   (widget.isSaving == true){
   double newAmount = double.parse(
                                        collectionn.updateamount.text,
                                      );
                                      String newAmountString =
                                          newAmount.toString();

                                      databaseHelper.updateAmount(
                                        widget.account,
                                        newAmountString,
                                      );
                                      collectionn.trandatebs.clear();
                                       collectionn.trandatead.clear();
                                        collectionn.accountnumber.clear();
                                         collectionn.amount.clear();
                                         collectionn.updateamount.clear();
                                         _loadSavingCollections();
                                           Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Collectionsheets(
            index: 0,
          ),
        ),
      );
                                              }
                                              else{
                                                double loanAmount = double.parse(
                                        collectionn.updateloanamount.text,
                                      );
                                      String newAmountString =
                                          loanAmount.toString();

                                      databaseHelper.updateloancollection(
                                        widget.account,
                                        newAmountString,
                                      );
                                      collectionn.loantrandatebs.clear();
                                       collectionn.loantrandatead.clear();
                                        collectionn.loanaccountnumber.clear();
                                         collectionn.loanamount.clear();
                                         collectionn.updateloanamount.clear();
                                         _loadLoanCollections();
                                                  Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Collectionsheets(
            index: 2,
          ),
        ),
      );                              
}
                                                        
                                        print("printing indesx${widget.navigatetoloancollection}");
     
                                      
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: AppColors.primaryBlue,
                                      ),
                                      height: 40.h,
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    trandateadController.dispose();
    trandatebsController.dispose();
    accountnumberController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
