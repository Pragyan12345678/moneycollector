import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';

class AccountTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          // height: 60.h,
          child: Row(
            children: [
             
             
              AccountCell(
                label: "Acc",
              ),
              Div(),
              AccountCell(
                label: "Type",
              ),
              Div(),
              AccountCell(
                label: "ID",
              ),
              Div(),
              AccountCell(
                label: "Name",
              ),
              Div(),
              AccountCell(
                label: "Phone",
              ),
              Div(),
              AccountCell(
                label: "Code",
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
      thickness: 1,
      color: AppColors.primaryBlue,
    );
  }
}

class AccountCell extends StatefulWidget {
  final String label;
  const AccountCell({
    Key? key, // Add Key? key here
    required this.label,
  }) : super(key: key); // Call super constructor with the provided key

  @override
  State<AccountCell> createState() => _AccountCellState();
}

class _AccountCellState extends State<AccountCell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(


color: Colors.white,
borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.label, // Access label through widget instance
                style:  TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp
                ),
  //                overflow: TextOverflow.clip, // Adjust overflow property
  // maxLines: 1,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
