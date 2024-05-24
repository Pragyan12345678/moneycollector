import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';


class AccountTextField extends StatelessWidget {
 final TextEditingController? controller;
  final String? label;

  const AccountTextField({super.key, this.controller,  required this.label});
  @override
  Widget build(BuildContext context) {


   return  Container(
      height: 50.h,
    
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color:AppColors.greyColor,
        // border: Border.all(color: AppColors.textColorBlack,), // Border color set to black
        borderRadius: BorderRadius.circular(5.0),
        
      ),
      child: Row(
        
        children: [
          // Left Column (Constant)
          Expanded(
            flex: 2,
            child: Container(
              height: 50.h,
            
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
              padding: EdgeInsets.only(right: 10.0,left: 10),

              child: Center(
                child:
                 Text(
                  label!, 
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
                // color: Colors.white, // Background color set to grey
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'xxxxx-xxxx-xx',
                    hintStyle: subtitleStyle.copyWith(
                    color: Colors.grey,

                    ),
                    
                    border: InputBorder.none,
                  ),
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

