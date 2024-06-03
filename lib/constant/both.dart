import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CalenderField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool
      useNepaliCalendar; // Dynamic parameter to determine whether to use Nepali calendar

  const CalenderField({
    Key? key,
    required this.controller,
    required this.label,
    required this.useNepaliCalendar,
  }) : super(key: key);

  @override
  _CalenderFieldState createState() => _CalenderFieldState();
}

class _CalenderFieldState extends State<CalenderField> {
  late DateTime _selectedDate;
  late nepali.NepaliDateTime _selectedNepaliDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedNepaliDate = nepali.NepaliDateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    if (widget.useNepaliCalendar) {
      final nepali.NepaliDateTime? picked = await showMaterialDatePicker(
        context: context,
        initialDate: _selectedNepaliDate,
        firstDate: nepali.NepaliDateTime(1970),
        lastDate: nepali.NepaliDateTime.now(),
      );
      if (picked != null && picked != _selectedNepaliDate) {
        setState(() {
          _selectedNepaliDate =
              nepali.NepaliDateTime(picked.year, picked.month, picked.day);
          widget.controller.text =
              _selectedNepaliDate.toString().split(' ')[0];// Format this as needed
              
        });
      }
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = DateTime(picked.year, picked.month, picked.day);
          widget.controller.text =
              _selectedDate.toString().split(' ')[0]; // Format this as needed

              
        });
      }
    }
  }

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
          height: 8,
        ),
        Container(
          // height: 6.h, // Set height to 50
          decoration: const BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                TextField(
                  // cursorColor: Colors.transparent,
                  controller: widget.controller,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: widget.useNepaliCalendar
                        ? 'Select Nepali Date'
                        : 'Select Date',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20), // Adjust vertical padding
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                      color: Colors.grey,
                    ),
                    border: InputBorder.none
            
                    // border: const OutlineInputBorder(
                      
                    
                    //   borderSide: BorderSide(
                    //     color: AppColors.textColorBlack,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
