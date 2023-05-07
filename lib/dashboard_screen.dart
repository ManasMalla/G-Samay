import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:g_samay/calendar.dart';
import 'package:g_samay/explore.dart';
import 'package:g_samay/schedule.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var screenIndex = 0;
  @override
  void initState() {
    super.initState();

    FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFFFFF4F5),
        height: kBottomNavigationBarHeight * 1.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  screenIndex = 0;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FeatherIcons.home,
                    size: 16,
                    color: const Color(0xFF981F2B)
                        .withOpacity(screenIndex == 0 ? 1 : 0.3),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Dashboard",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF981F2B)
                          .withOpacity(screenIndex == 0 ? 1 : 0.3),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  screenIndex = 1;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FeatherIcons.calendar,
                    size: 16,
                    color: const Color(0xFF981F2B)
                        .withOpacity(screenIndex == 1 ? 1 : 0.3),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Calendar",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF981F2B)
                          .withOpacity(screenIndex == 1 ? 1 : 0.3),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  screenIndex = 2;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FeatherIcons.clock,
                    size: 16,
                    color: const Color(0xFF981F2B)
                        .withOpacity(screenIndex == 2 ? 1 : 0.3),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Schedule",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF981F2B)
                          .withOpacity(screenIndex == 2 ? 1 : 0.3),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  screenIndex = 3;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FeatherIcons.compass,
                    size: 16,
                    color: const Color(0xFF981F2B)
                        .withOpacity(screenIndex == 3 ? 1 : 0.3),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Explore",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF981F2B)
                          .withOpacity(screenIndex == 3 ? 1 : 0.3),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(-1.2, 0), end: const Offset(0, 0))
                .animate(animation),
            child: child,
          );
        },
        duration: const Duration(milliseconds: 300),
        child: screenIndex == 0
            ? const Dashboard()
            : screenIndex == 1
                ? const CalendarScreen()
                : screenIndex == 2
                    ? const SchedulePage()
                    : const ExplorePage(),
      ),
    );
  }
}
