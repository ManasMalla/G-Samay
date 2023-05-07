import 'package:feather_icons/feather_icons.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

List myEvents = [
  'Discrete Math - MATH1041',
  'Chemistry - CHEM1001',
  'Robotics - EECE1011'
];

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF981F2B),
        onPressed: () {
          TextEditingController newCont = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        myEvents.add(newCont.text);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Add'))
              ],
              content: TextField(
                controller: newCont,
                decoration: InputDecoration(hintText: 'Add new'),
              ),
            ),
          );
        },
        child: Icon(
          FeatherIcons.plus,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
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
                  "Set reminders for specific events, lectures, seminars or tasks and balance out your academic life",
                  style: GoogleFonts.poppins()),
              SizedBox(
                height: 24,
              ),
              TableCalendar(
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selected = focusedDay;
                  });
                  print(focusedDay);
                },
                focusedDay: selected,
                firstDay: DateTime.now().subtract(Duration(days: 365)),
                lastDay: DateTime.now().add(Duration(days: 365)),
                calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                        color: const Color(0xFF981F2B).withOpacity(0.6),
                        shape: BoxShape.circle),
                    todayDecoration: BoxDecoration(
                        color: const Color(0xFF981F2B),
                        shape: BoxShape.circle)),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                        color: const Color(0xFF981F2B),
                        fontWeight: FontWeight.w600),
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
              ),
              SizedBox(
                height: 16,
              ),
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: index == 0
                              ? Color(0xFF981F2B)
                              : index == 1
                                  ? Color(0xFF981F2B).withOpacity(0.1)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: index == 0 || index == 1
                                  ? Colors.transparent
                                  : Color(0xFF981F2B))),
                      padding: EdgeInsets.all(12),
                      child: Row(children: [
                        Icon(
                          FeatherIcons.hash,
                          size: 12,
                          color: index == 0 ? Colors.white : Color(0xFF981F2B),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          myEvents[index],
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: index == 0
                                  ? Colors.white
                                  : Color(0xFF981F2B)),
                        ),
                        Spacer(),
                        Text(
                          "10:00 - 10:50",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: index == 0
                                  ? Colors.white
                                  : Color(0xFF981F2B)),
                        )
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ),
                  itemCount: myEvents.length)
            ],
          ),
        ),
      ),
    );
  }
}
