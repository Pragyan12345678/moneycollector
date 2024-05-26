import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/modules/Collection/editcollection.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';

class TableBodyRow extends StatefulWidget {
  final String sn;
   final String customer;
    final String account;
      final String amount;
 final String action;

  const TableBodyRow({
    required this.sn,
    required this.account,
    required this.amount,
    required this.action, required this.customer,
  });
  @override
  State<TableBodyRow> createState() => _TableBodyRowState();
}

class _TableBodyRowState extends State<TableBodyRow> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.sn,
                          style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
                        ), 
                      ],
                    ),
                  ),
                ),
                 const VerticalDivider(
                  thickness: 1,
                  color: AppColors.greyColor,
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
                 Container(
                            // height: 30,
                            // width: 30,

                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CollectionForm(



                                          
                                        ),
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
                                      height: 15,
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
                
               
              ],
            ),
          ),
          Horizentaldiv()
        ],
      ),
    );
  }
}

class Horizentaldiv extends StatelessWidget {
  const Horizentaldiv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      
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
      thickness: 1,
      color: AppColors.greyColor,
    );
  }
}

class Cell extends StatefulWidget {
  final String label;
  const Cell({
    Key? key, // Add Key? key here
    required this.label,
  }) : super(key: key); // Call super constructor with the provided key

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
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
