import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g_samay/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profile = {};
  String? image;
  var iwdColor = Color(0xFF981F2B);
  var notifications = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.chevron_left_rounded)),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          ClipOval(
                            child: Image.network(
                              "https://avatars.githubusercontent.com/u/38750492?v=4",
                              height: 128,
                              width: 128,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(secondary: Color(0xFF981F2B))),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.displayName ??
                                "Student",
                            style: GoogleFonts.poppins(fontSize: 36),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text(
                              FirebaseAuth.instance.currentUser?.email ??
                                  "user@gitam.in",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, letterSpacing: 2),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Student".toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | Class of 2026".toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          (profile["user_role"] ?? "Attendee") != "Attendee"
                              ? Container(
                                  margin: EdgeInsets.only(top: 16, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: iwdColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  child: Text(
                                    profile["user_role"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white),
                                  ))
                              : SizedBox(),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Life’s too short & beautiful! Let’s keep making miracles & Enjoy what life throws at us with an enthusiastic spirit& a bright smile!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Notification Settings",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: notifications[0],
                                  onChanged: (value) {
                                    setState(() {
                                      notifications[0] = value ?? true;
                                    });
                                  }),
                              SizedBox(
                                width: 94,
                                child: Text(
                                  "Classes",
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              SizedBox(
                                width: 36,
                              ),
                              Checkbox(
                                  value: notifications[1],
                                  onChanged: (value) {
                                    setState(() {
                                      notifications[1] = value ?? true;
                                    });
                                  }),
                              Text(
                                "Events",
                                style: GoogleFonts.poppins(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: notifications[2],
                                  onChanged: (value) {
                                    setState(() {
                                      notifications[2] = value ?? true;
                                    });
                                  }),
                              Text(
                                "Examinations",
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                width: 36,
                              ),
                              Checkbox(
                                  value: notifications[3],
                                  onChanged: (value) {
                                    setState(() {
                                      notifications[3] = value ?? true;
                                    });
                                  }),
                              Text(
                                "Deadlines",
                                style: GoogleFonts.poppins(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: notifications[4],
                                  onChanged: (value) {
                                    setState(() {
                                      notifications[4] = value ?? true;
                                    });
                                  }),
                              Text(
                                "Lectures",
                                style: GoogleFonts.poppins(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                              },
                              child: Text(
                                "Logout".toUpperCase(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF981F2B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Image.network(
                            "https://i.pinimg.com/originals/1f/8d/07/1f8d074a8237fa4a7d32f8d6f87874d1.png",
                            height: 64,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
