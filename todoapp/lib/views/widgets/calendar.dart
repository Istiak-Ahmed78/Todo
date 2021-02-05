import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

///Separated because it will be used in other screens too.
class Calendar extends StatelessWidget {
  const Calendar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: CalendarCarousel(
        weekendTextStyle: TextStyle(
          color: Colors.black87,
        ),
        weekdayTextStyle: TextStyle(color: Colors.black45),
        todayTextStyle: TextStyle(
          color: Colors.red[500],
          fontWeight: FontWeight.w700,
        ),
        daysTextStyle: TextStyle(
          color: Colors.black87,
        ),
        thisMonthDayBorderColor: null,
        selectedDateTime: null,
        weekFormat: true,
        height: 80.0,
        showHeader: false,
        todayBorderColor: null,
        todayButtonColor: null,
        selectedDayBorderColor: null,
        selectedDayButtonColor: null,
        pageSnapping: true,
        weekDayMargin: EdgeInsets.only(bottom: 0.0),

        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }
}
