import 'dart:math';

import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_samay/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: const Color(0xFF981F2B),
                height: 460,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 28, left: 28, right: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: SizedBox(
                              height: 54,
                              width: 54,
                              child: Image.network(
                                  "https://avatars.githubusercontent.com/u/38750492?v=4"),
                            ),
                          ),
                          const Spacer(),
                          Transform.rotate(
                            angle: -pi / 2,
                            child: const Icon(
                              FeatherIcons.barChart2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                            },
                            icon: Icon(
                              FeatherIcons.power,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Text(
                        "Good Morning",
                        style: GoogleFonts.poppins(
                            fontSize: 36, color: Colors.white),
                      ),
                      Text(
                        "${((FirebaseAuth.instance.currentUser?.displayName?.isEmpty ?? true) ? "User" : FirebaseAuth.instance.currentUser?.displayName) ?? "User"}.",
                        style: GoogleFonts.poppins(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: SizedBox(
                          width: 150,
                          child: Text(
                            "“You can be what you want”",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Positioned(
                bottom: -36,
                child: Opacity(
                  opacity: 0.08,
                  child: Text(
                    "#GITAM",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 86,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: -54,
                  child: Image.asset(
                    "assets/dashboard.png",
                    height: 280,
                  ))
            ],
          ),
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your briefing",
                    style: GoogleFonts.poppins(fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Lectures".toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF981F2B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.chevronRight,
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF981F2B),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.hash,
                        size: 12,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Discrete Math - MATH1041",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF981F2B).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.droplet,
                        size: 12,
                        color: Color(0xFF981F2B),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Chemistry - CHEM1001",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF981F2B)),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.codesandbox,
                        size: 12,
                        color: Color(0xFF981F2B),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sensors & SC - EECE1011",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Things to do".toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF981F2B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.chevronRight,
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF981F2B),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.penTool,
                        size: 12,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Assignment - Chemistry",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF981F2B).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.book,
                        size: 12,
                        color: Color(0xFF981F2B),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Chemistry Quiz - 03",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF981F2B)),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.video,
                        size: 12,
                        color: Color(0xFF981F2B),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Session by Abdul Bariq",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF981F2B)),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        FeatherIcons.code,
                        size: 12,
                        color: Color(0xFF981F2B),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "The 48 hour ideathon",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      ),
                      Spacer(),
                      Text(
                        "10:00 - 10:50",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Color(0xFF981F2B)),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
