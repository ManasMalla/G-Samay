import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "Lessons schedule",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF981F2B)),
              ),
              Row(
                children: [
                  Text(
                    "Today lessons ".toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xFF981F2B)),
                  ),
                  Text(
                    "(7)",
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0x50981F2B)),
                  )
                ],
              ),
              SizedBox(
                height: 72,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text("8:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("9:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("10:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("11:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("12:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("13:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("14:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("15:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: const [
                          Text("16:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0DEDF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.only(top: 16),
                        height: 144,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFF981F2B).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FeatherIcons.code,
                                  size: 20,
                                  color: Color(0xFF981F2B),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Programming with Python",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF981F2B),
                                    ),
                                  ),
                                  Text(
                                    "8:00 - 9:50 | Yashoda Devi",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF981F2B).withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Row(
                        children: const [
                          Text("10:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        decoration: BoxDecoration(
                          color: const Color(0xFF981F2B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 64,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FeatherIcons.hash,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Discrete Mathematics",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "10:00 - 10:50 | Akkapedi CS",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Row(
                        children: [
                          Text("11:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4F060D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 64,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    FeatherIcons.droplet,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chemistry",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "11:00 - 11:50 | GVR Sharma",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Row(
                        children: [
                          Text("12:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEA4335).withOpacity(0.45),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 64,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    FeatherIcons.codesandbox,
                                    size: 20,
                                    color: Color(0x70EA4335),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sensors & SC",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "12:00 - 12:50 | Raghavendra",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Row(
                        children: [
                          Text("13:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: [
                          Text("14:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 48),
                        decoration: BoxDecoration(
                          color: const Color(0x50981F2B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 64,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    FeatherIcons.feather,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Venture Development",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "14:00 - 114:50 | Dr. Lakshmi",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Row(
                        children: [
                          Text("15:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: [
                          Text("16:00"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 64,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
