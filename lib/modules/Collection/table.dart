import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';

class TableHeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SN",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
              const Cell(
                label: "Customer Name",
              ),
              const Div(),
              const Cell(
                label: "Account no",
              ),
              const Div(),
              const Cell(
                label: "Amount",
              ),
              const Div(),
              const Cell(
                label: "Action",
              ),
              
             
            ],
          ),
        ),
        Horizentaldiv()
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
