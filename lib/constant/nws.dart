import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';

class DateField extends StatefulWidget {
  final String title;
  const DateField({Key? key, required this.title}) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  NepaliDateTime? _selectedDateAd;
  NepaliDateTime? _selectedDateBs;

 Future<void> _selectDate(BuildContext context, bool isAd) async {
  final locale = isAd ? const Locale('en') : const Locale('ne'); // Set locale based on calendar format
  final picked = await showMaterialDatePicker(
    context: context,
    initialDate: isAd ? _selectedDateAd ?? NepaliDateTime.now() : _selectedDateBs ?? NepaliDateTime.now(),
    firstDate: NepaliDateTime(2000),
    lastDate: NepaliDateTime(2100),
    locale: locale, // Pass the locale to the date picker
  );
  if (picked != null) {
    setState(() {
      if (isAd) {
        _selectedDateAd = picked;
        _selectedDateBs = NepaliDateTime.parse(NepaliDateFormat("yyyy-MM-dd").format(picked));
      } else {
        _selectedDateBs = picked;
        _selectedDateAd = NepaliDateTime.parse(NepaliDateFormat("yyyy-MM-dd").format(picked));
      }
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Date (${_selectedDateAd != null ? "AD" : "BS"})', // Update label based on selected calendar format
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, true),
                    ),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _selectedDateAd != null
                        ? NepaliDateFormat.yMMMMd().format(_selectedDateAd!) // Display in Nepali date format for AD
                        : _selectedDateBs != null
                            ? NepaliDateFormat.yMMMMd().format(_selectedDateBs!) // Display in Nepali date format for BS
                            : '',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

// Example usage:
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar Text Field Example')),
      body: Center(
        child: Column(
          children: [
            DateField(title: 'Date AD'),
            DateField(title: 'Date BS'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: YourWidget(),
  ));
}
