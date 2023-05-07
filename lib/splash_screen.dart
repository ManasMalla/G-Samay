import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_samay/dashboard_screen.dart';
import 'package:g_samay/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "https://www.gitam.edu/sites/default/files/2022-08/science_building-1.png",
              height: getHeight(constraints, 600),
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
            ),
            Positioned(bottom: 0, child: Image.asset("assets/car_pool.png")),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: getHeight(constraints, 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/gitam.png",
                      height: getHeight(constraints, 40),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "G-Samay",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: getHeight(constraints, 48),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getHeight(constraints, 24),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.7,
                      child: Text(
                        "Never again let forgetfulness or lack of awareness let you miss upcoming academic events and deadlines",
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(constraints, 24),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                FirebaseAuth.instance.currentUser != null
                                    ? const DashboardScreen()
                                    : const OnboardingScreen()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Get Started".toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }

  getHeight(BoxConstraints constraints, int i) {
    return (constraints.maxHeight * i) / 764;
  }
}
