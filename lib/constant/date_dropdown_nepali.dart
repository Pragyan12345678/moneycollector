import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/Customdropdown.dart';
import 'package:moneycollection/constant/date_dropdown_english.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:provider/provider.dart';


class DateDropdownNepali extends StatefulWidget {
  const DateDropdownNepali({super.key});

  @override
  State<StatefulWidget> createState() => _DateDropdownNepaliState();
}

class _DateDropdownNepaliState extends State<DateDropdownNepali> {
  List<Month> nepaliMonthsList = [
    Month(1, 'January', 'बैशाख'),
    Month(2, 'February', 'जेष्ठ'),
    Month(3, 'March', 'आषाढ'),
    Month(4, 'April', 'श्रावण'),
    Month(5, 'May', 'भाद्र'),
    Month(6, 'June', 'आश्वयुज'),
    Month(7, 'July', 'कार्तिक'),
    Month(8, 'August', 'मंसिर'),
    Month(9, 'September', 'पुष'),
    Month(10, 'October', 'माघ'),
    Month(11, 'November', 'फागुन'),
    Month(12, 'December', 'चैत्र'),
  ];
  List<int> nepaliDaysList = List.generate(32, (index) => index + 1);
  List<int> yearsList = [];
  Month? selectedMonth;
  int selectedDay = 1;
  int selectedMonthId = 1;
  int selectedYear = DateTime.now().year + 56;

  @override
  void initState() {
    super.initState();
    // Populate the list with years from the current year to 100 years ago
    int currentYear = DateTime.now().year + 56;
    for (int i = currentYear; i >= currentYear - 100; i--) {
      yearsList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanStateProvider>(
      builder: (context, DateState, child) {
        return Consumer<ThemeModel>(builder: (context, theme, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomDropdownButton(
                      hint: Text(
                        nepaliMonthsList.first.nameNepali,
                      ),
                      value: selectedMonth,
                      items: nepaliMonthsList.map(
                        (Month month) {
                          return DropdownMenuItem<Month>(
                            value: month,
                            child: Text(
                              month.nameNepali,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (selected) {
                        setState(
                          () {
                            selectedMonth = selected;
                            selectedMonthId = selectedMonth!.id;
                            DateState.month = NepaliDateTime(
                              selectedYear,
                              selectedMonthId,
                              selectedDay,
                            ).toDateTime().month;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: CustomDropdownButton(
                      value: selectedDay,
                      items: nepaliDaysList.map((int day) {
                        return DropdownMenuItem<int>(
                          value: day,
                          child: Text('$day'),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedDay = selected!;
                          DateState.day = NepaliDateTime(
                                  selectedYear, selectedMonthId, selectedDay)
                              .toDateTime()
                              .day;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: CustomDropdownButton(
                      value: selectedYear,
                      items: yearsList.map((int year) {
                        return DropdownMenuItem<int>(
                          value: year,
                          child: Text('$year'),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedYear = selected!;
                          DateState.year = NepaliDateTime(
                            selectedYear,
                            selectedMonthId,
                            selectedDay,
                          ).toDateTime().year;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${NepaliDateTime(selectedYear, selectedMonthId, selectedDay).toDateTime().year} - ${NepaliDateTime(selectedYear, selectedMonthId, selectedDay).toDateTime().month} - ${NepaliDateTime(selectedYear, selectedMonthId, selectedDay).toDateTime().day} AD",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBrown,
                  fontSize: 16.sp,
                ),
              )
            ],
          );
        });
      },
    );
  }
}
