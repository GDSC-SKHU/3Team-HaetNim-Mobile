import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// 캘린더에 아무런 이벤트 없음


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final TextEditingController _DataTimeEditingController = TextEditingController();
  final TextEditingController _EstimatedEditingController = TextEditingController();

  DateTime? tempPickedDate;




  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     // Calendar View <오늘 날짜>
      body:
      SafeArea(
        child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                // calendar popup
                _selectDataCalendar_Expecteddate_visit(context);
              },
              child: AbsorbPointer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                      isDense: true,
                      hintText: "날짜를 선택하세요",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _DataTimeEditingController,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


  // 캘린더 가져오기
  // ignore: non_constant_identifier_names
  void _selectDataCalendar_Expecteddate_visit(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 550,
              child: SfDateRangePicker(
                monthViewSettings: DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                ),
                monthFormat: 'MMM',
                showNavigationArrow: true,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 25, color: Colors.redAccent),
                ),
                headerHeight: 80,
                view: DateRangePickerView.month,
                allowViewNavigation: false,
                backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                initialSelectedDate: DateTime.now(),
                minDate: DateTime.now(),
                // 아래코드는 tempPickedDate를 전역으로 받아 시작일을 선택한 날자로 시작할 수 있음
                // minDate: tempPickedDate,
                maxDate: DateTime.now().add(Duration(days: 365)),
                // 아래 코드는 선택시작일로부터 2주까지밖에 날자 선택이 안됌
                // maxDate: tempPickedDate!.add(new Duration(days: 14)),
                selectionMode: DateRangePickerSelectionMode.single,
                confirmText: '완료',
                cancelText: '취소',
                onSubmit: (args) => {
                  setState(() {
                    _EstimatedEditingController.clear();
                    // tempPickedDate = args as DateTime?;
                    _DataTimeEditingController.text = args.toString();
                    convertDateTimeDisplay(
                        _DataTimeEditingController.text, '선택');
                    Navigator.of(context).pop();
                  }),
                  

                },
                onCancel: () => Navigator.of(context).pop(),
                showActionButtons: true,
              ),
            ),
          ));
        });
  }
  
  String convertDateTimeDisplay(String date, String text) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    if (text == '선택') {
      _EstimatedEditingController.clear();
      return _DataTimeEditingController.text =
          serverFormater.format(displayDate);
    } else {
      return _EstimatedEditingController.text =
          serverFormater.format(displayDate);
    }
  }
}

