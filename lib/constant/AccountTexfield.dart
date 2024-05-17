import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moneycollection/constant/colors.dart';

class AccountTextField extends StatefulWidget {
  late TextEditingController _controller;
  @override
  State<AccountTextField> createState() => _AccountTextFieldState();
}

class _AccountTextFieldState extends State<AccountTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
    
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border.all(color: AppColors.textColorBlack,), // Border color set to black
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        
        children: [
          // Left Column (Constant)
          Expanded(
            flex: 2,
            child: Container(
              height: 64,
              color: Colors.grey,
              padding: EdgeInsets.only(right: 10.0,left: 10),
              child: Center(
                child:
                 Text(
                  'KTM001-',
                   style: subtitleStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Right Column (Editable)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                color: Colors.white, // Background color set to grey
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'xxxxx-xxxx-xx',
                    hintStyle: subtitleStyle.copyWith(
                    color: Colors.grey,
                    ),
                    
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
