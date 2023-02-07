import 'dart:ui';
import 'package:flutter/src/painting/gradient.dart' as FG;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var MQwidth, MQsize, MQwLevel, MQheight;

  // ignore: non_constant_identifier_names
  String PersonName = "Brian Devalda";
  // ignore: non_constant_identifier_names
  String DescBio = "Junior UI/UX Developer";
  bool isActiveUp = false;
  bool isActiveDelay = false;

  void animatedText() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isActiveDelay = true;
      });
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isActiveUp = true;
      });
    });
    animatedText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MQsize = MediaQuery.of(context).size;
    MQheight = MQsize.height;
    MQwidth = MQsize.width;
    MQwLevel = (MQwidth - 300) / 2;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: 3,
            child: SizedBox(
                height: MQwidth,
                width: MQheight,
                child: const RiveAnimation.asset(
                  fit: BoxFit.cover,
                  "assets/RiveAssets/Space.riv",
                  artboard: "2352 [Converted].svg",
                  // onInit:
                )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(children: [
            // header profile view
            AnimatedPositioned(
              top: isActiveUp ? 80 : 50,
              left: isActiveUp ? 50 : MQwLevel,
              curve: Curves.slowMiddle,
              duration: const Duration(milliseconds: 800),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.slowMiddle,
                  width: isActiveUp ? 90 : 300,
                  height: isActiveUp ? 130 : 400,
                  color: Color.fromARGB(240, 255, 255, 255),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.slowMiddle,
              bottom: isActiveUp ? 550 : 285,
              left: 33,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: isActiveUp ? 0 : 1,
                curve: Curves.easeInOutSine,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveDelay = !isActiveDelay;
                    });
                  },
                  child: Column(children: [
                    AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        style: isActiveDelay
                            ? GoogleFonts.londrinaSolid(
                                fontSize: 45,
                                color: Color.fromARGB(255, 255, 255, 255))
                            : GoogleFonts.londrinaSketch(
                                fontSize: 60,
                                color: Color.fromARGB(255, 255, 255, 255)),
                        child: Text(PersonName)),
                    Text(
                      DescBio,
                      style: GoogleFonts.orbitron(
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )
                  ]),
                ),
              ),
            ),
            // body biodata
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveUp = !isActiveUp;
                      isActiveDelay = !isActiveDelay;
                    });
                  },
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                    child: AnimatedContainer(
                      curve: Curves.slowMiddle,
                      height: isActiveUp ? 600 : 200,
                      width: MediaQuery.of(context).size.width,
                      color: isActiveUp
                          ? const Color.fromARGB(240, 62, 10, 94)
                          : const Color.fromARGB(191, 59, 30, 108),
                      duration: const Duration(milliseconds: 800),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              right: 50,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: isActiveUp ? 1.0 : 0,
                curve: Curves.easeInOutSine,
                child: Column(children: [
                  Text(
                    PersonName,
                    style: GoogleFonts.londrinaSolid(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    DescBio,
                    style: GoogleFonts.orbitron(
                        fontSize: 10,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
