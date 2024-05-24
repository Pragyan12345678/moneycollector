import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';

class FormCustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;

  const FormCustomTextField(String s, 
    {
    super.key, required this.label, required this.controller, this.hintText,
    
  });

  @override
  _FormCustomTextFieldState createState() => _FormCustomTextFieldState();
}

class _FormCustomTextFieldState extends State<FormCustomTextField> {
  bool _isFocused = false;
    bool _hasData = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: _isFocused ? AppColors.greyColor : AppColors.greyColor ,
            borderRadius: BorderRadius.circular(5),
            
          ),
          child: TextFormField(
            style: subtitleStyle,
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorStyle: subtitleStyle.copyWith(
                color: Colors.red,
                fontSize: 10.sp,
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 10.w,
              ),
              hintText: widget.hintText,
              hintStyle: subtitleStyle.copyWith(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textColorBlack,
                ),
              ),
              // enabledBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color.fromARGB(255, 110, 98, 98),
              //   ),
              // ),
              // errorBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //   ),
              // ),
            ),
            onTap: () {
              setState(() {
                _isFocused = true;
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                _isFocused = false;
              });
            },
            onChanged: (value) {
              setState(() {
                _isFocused = true;
              });
            },
          ),
        ),
      ],
    );
  }
}
