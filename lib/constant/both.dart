import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CalenderField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool useNepaliCalendar; // Dynamic parameter to determine whether to use Nepali calendar

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
          _selectedNepaliDate = nepali.NepaliDateTime(picked.year, picked.month, picked.day);
          widget.controller.text = '${_selectedNepaliDate.year}-${_selectedNepaliDate.month}-${_selectedNepaliDate.day}'; // Format this as needed
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
          widget.controller.text = _selectedDate.toString().split(' ')[0]; // Format this as needed
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
            color: Colors.grey,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 60.h, // Set height to 50
          child: Column(
            children: [
              TextField(
                  // cursorColor: Colors.transparent,
                controller: widget.controller,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  
                  hintText: widget.useNepaliCalendar ? 'Select Nepali Date' : 'Select Date',
                  contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 20), // Adjust vertical padding
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                    color: Colors.grey,
                  ),
                  
                  border: OutlineInputBorder(
                    
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
