import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36,
              ),
              Text(
                "Calendar",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac leo eu justo feugiat interdum.",
                  style: GoogleFonts.poppins()),
              SizedBox(
                height: 24,
              ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.now().subtract(Duration(days: 365)),
                lastDay: DateTime.now().add(Duration(days: 365)),
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: const Color(0xFF981F2B),
                        shape: BoxShape.circle)),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(color: const Color(0xFF981F2B)),
                    leftChevronIcon: Icon(
                      FeatherIcons.chevronLeft,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    rightChevronIcon: Icon(
                      FeatherIcons.chevronRight,
                      color: Colors.black.withOpacity(0.6),
                    )),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)),
                  weekendStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)),
                  dowTextFormatter: (date, locale) {
                    return (date.weekday != 4)
                        ? DateFormat('EE').format(date)[0]
                        : DateFormat('EE').format(date).substring(0, 2);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
