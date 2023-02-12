import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import '../route/name_route.dart';

const colorizeColors = [
  Color(0xFF790f6a),
  Color(0xFFb93692),
  Color(0xFFe851c4),
  Color(0xFFb93692),
];

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isElevated = true;
  late AnimationController _controller;

  @override
  void initState() {
    setState(() {
      _isElevated = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // body: Center(child: CircularProgressIndicator()),
      backgroundColor: Color(0xFF462d54),
      body: Center(
          child: GestureDetector(
        onLongPress: () {
          if (_isElevated == true) {
            setState(() {
              _isElevated = false;
              Future.delayed(const Duration(milliseconds: 450), () {
                Get.toNamed(RouteName.home);
              });
            });
          } else if (_isElevated == false) {
            setState(() {
              _isElevated = true;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            color: Color(0xFF462d54),
            borderRadius: BorderRadius.circular(50),
            boxShadow: _isElevated
                ? [
                    BoxShadow(
                      color: Color.fromARGB(255, 48, 16, 66)!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Color.fromARGB(255, 77, 57, 89),
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]
                : null,
          ),
          // ignore: prefer_const_constructors
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
                height: 200,
                width: 300,
                child: RiveAnimation.asset(
                  fit: BoxFit.cover,
                  "assets/RiveAssets/Rocket.riv",
                  artboard: "New Artboard",
                  // onInit:
                )),
            Text(
              "Welcome to",
              style: GoogleFonts.orbitron(fontSize: 40, color: Colors.white),
            ),
            Text(
              "Devalda Space",
              style: GoogleFonts.oswald(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText('Hold Press to Continue',
                    textStyle: GoogleFonts.orbitron(fontSize: 20),
                    colors: colorizeColors,
                    speed: const Duration(milliseconds: 400))
              ],
            )
          ]),
        ),
      )),
    );
  }
}
