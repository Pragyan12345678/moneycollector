import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:moneycollection/modules/Collection/editcollection.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/provider/service/Dbservices.dart';

class TableBodyRow extends StatefulWidget {
  final int indexxx;
  final String sn;
  final String customer;
  final String account;
  final String amount;
  final String datead;
  final String datebs;
  final bool isSaving;

  const TableBodyRow({
    super.key,
    required this.sn,
    required this.account,
    required this.amount,
    required this.customer,
    required this.indexxx,
    required this.isSaving,
    required this.datead,
    required this.datebs,
  });

  @override
  State<TableBodyRow> createState() => _AccountTableBodyRowState();
}

class _AccountTableBodyRowState extends State<TableBodyRow> {
  List<Entries> savingCollections = [];
  List<Entries> loanCollections = [];

  @override
  void initState() {
    super.initState();
    _loadSavingCollections();
    _loadLoanCollections();
  }

  Future<void> _loadSavingCollections() async {
    List<Entries> collections =
        await DatabaseHelper.instance.getAllgetsavingcollection();
    setState(() {
      savingCollections = collections;
    });
  }

  Future<void> _loadLoanCollections() async {
    List<Entries> loancollections =
        await DatabaseHelper.instance.getAllgetloancollection();

    setState(() {
      loanCollections = loancollections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: 50.h,
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.sn,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1,
                color: AppColors.primaryBlue,
              ),
              Cell(
                label: widget.customer,
              ),
              const Div(),
              Cell(
                label: widget.account,
              ),
              const Div(),
              Cell(
                label: widget.amount,
              ),
              const Div(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditCollectionForm(
                                inde: widget.indexxx,
                                datead: widget.datead,
                                datebs: widget.datebs,
                                account: widget.account,
                                amount: widget.amount,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 25.h,
                          width: 25.w,
                          child: Image.asset(
                            AppImages.edit,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm Deletion"),
                                content: const Text(
                                    "Are you sure you want to delete this entry?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      try {
                                        DatabaseHelper databaseHelper =
                                            DatabaseHelper.instance;

                                        if (widget.isSaving == true) {
                                          _loadSavingCollections();
                                          databaseHelper.deletesavingcollection(
                                              widget.account);
                                        } else {
                                          databaseHelper.deleteloancollection(
                                              widget.account);
                                          _loadLoanCollections();
                                        }
                                      } catch (error) {
                                        print("Error deleting entry: $error");
                                      }
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            AppImages.remove,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Horizentaldiv(),
      ],
    );
  }
}

class Horizentaldiv extends StatelessWidget {
  const Horizentaldiv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.greyColor,
    );
  }
}

class Div extends StatelessWidget {
  const Div({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 2,
      color: AppColors.greyColor,
    );
  }
}

class Cell extends StatefulWidget {
  final String label;
  const Cell({
    super.key, // Add Key? key here
    required this.label,
  }); // Call super constructor with the provided key

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Text(
                widget.label, // Access label through widget instance
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}