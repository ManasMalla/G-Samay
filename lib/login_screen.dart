import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_samay/dashboard_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var obscureText = true;
  var isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF981F2B),
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: GoogleFonts.poppins(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24, top: 8),
                            child: Text(
                              "Let’s not waste anymore time. Get started by logging in with your credentials",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: emailController,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFF981F2B), width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Email Address"),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme:
                                  Theme.of(context).colorScheme.copyWith(
                                        secondary: Color(0xFF981f2b),
                                        primary: Color(0xFF981f2b),
                                      ),
                            ),
                            child: TextField(
                              obscureText: obscureText,
                              controller: passwordController,
                              style: GoogleFonts.poppins(),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF981F2B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Password"),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF981F2B),
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                )),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: const Color(0xFF981F2B),
                            minWidth: double.infinity,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                if ((await FirebaseAuth.instance
                                        .fetchSignInMethodsForEmail(
                                            emailController.text))
                                    .isNotEmpty) {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Welcome Back ${value.user?.displayName ?? "User"}")));
                                    if (value.user?.displayName?.isEmpty ??
                                        true) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UpdateDisplayName()));
                                    } else {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DashboardScreen()));
                                    }
                                  }).catchError((error) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(error.message ??
                                                error.toString())));
                                  });
                                } else {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Welcome, ${value.user?.displayName ?? "User"}")));
                                    if (value.user?.displayName?.isEmpty ??
                                        true) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UpdateDisplayName()));
                                    } else {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DashboardScreen()));
                                    }
                                  }).catchError((error) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(error.message ??
                                                error.toString())));
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

class UpdateDisplayName extends StatefulWidget {
  const UpdateDisplayName({super.key});

  @override
  State<UpdateDisplayName> createState() => _UpdateDisplayNameState();
}

class _UpdateDisplayNameState extends State<UpdateDisplayName> {
  var isLoading = false;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF981F2B),
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Just One Last Thing",
                            style: GoogleFonts.poppins(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24, top: 8),
                            child: Text(
                              "Enter your name to continue.",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: nameController,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFF981F2B), width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Student Name"),
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: const Color(0xFF981F2B),
                            minWidth: double.infinity,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                FirebaseAuth.instance.currentUser
                                    ?.updateDisplayName(nameController.text)
                                    .then((value) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen()));
                                });
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
