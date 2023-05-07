import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:g_samay/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  final Function() onNext;
  const Onboarding(this.title, this.description, this.index,
      {super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFF981F2B),
                        ),
                      ),
                      Container(
                        height: 28,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 16,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xFFFFAC00),
                      onPressed: () {
                        onNext();
                      },
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24, top: 8),
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: SizedBox(
                        height: 8,
                        child: ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, dotIndex) {
                              return ClipOval(
                                child: Container(
                                  color: dotIndex == index
                                      ? Color(0xFFFFAC00)
                                      : Color(0x20936214),
                                  height: 8,
                                  width: 8,
                                ),
                              );
                            },
                            separatorBuilder: (context, _) {
                              return SizedBox(
                                width: 12,
                              );
                            },
                            itemCount: 5),
                      )),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var titles = [
    "Stay Informed.",
    "Never miss out.",
    "Plan out.",
    "No more deadlines.",
    "Live your passion."
  ];
  var descriptions = [
    "View and manage your class schedules, exam dates, and other important academic events",
    "Receive notifications to remind you about upcoming events, deadlines and other important information",
    "Set reminders for specific events, lectures, seminars or tasks and balance out your academic life",
    "Customise your notification preferences and get the work done ahead of time",
    "Achieve more with GITAM by planning and balancing out your academic life and your passion"
  ];
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, pageIndex) {
        return Onboarding(
          titles[pageIndex],
          descriptions[pageIndex],
          pageIndex,
          onNext: () {
            if (pageIndex == 4) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            } else {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          },
        );
      },
      itemCount: 5,
    );
  }
}
