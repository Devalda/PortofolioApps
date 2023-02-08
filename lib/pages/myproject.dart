import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../route/name_route.dart';

class MyProject extends StatefulWidget {
  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  var MQwidth, MQsize, MQheight;
  bool isRotate = false;
  bool isPJ1 = false;
  bool isPJ2 = false;
  bool isPJ3 = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isRotate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MQsize = MediaQuery.of(context).size;
    MQwidth = MQsize.width;
    MQheight = MQsize.height;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        setState(() {
          isRotate = !isRotate;
        });
      },
      child: Stack(children: [
        InteractiveViewer(
          maxScale: 5,
          constrained: false,
          // boundaryMargin: const EdgeInsets.only(left: 10, right: 10),
          child: Stack(children: [
            SizedBox(
                height: MQheight,
                width: 1000,
                child: const RiveAnimation.asset(
                  fit: BoxFit.cover,
                  "assets/RiveAssets/Orbit.riv",
                  artboard: "Space Scene Demo",
                  // onInit:
                )),
            const Positioned(
              bottom: 190,
              left: 50,
              child: RotatedBox(
                quarterTurns: 2,
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: RiveAnimation.asset(
                      fit: BoxFit.cover,
                      "assets/RiveAssets/Arrow.riv",
                      artboard: "menu_to_left_arrow",
                      // onInit:
                    )),
              ),
            ),
            Positioned(
              top: 330,
              left: 330,
              child: Column(children: [
                Text(
                  "Try to",
                  style: GoogleFonts.orbitron(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Look Around !",
                  style: GoogleFonts.orbitron(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "*Tips: The Star are clickable",
                  style: GoogleFonts.orbitron(
                      fontSize: 15, color: Color.fromARGB(255, 249, 249, 249)),
                ),
              ]),
            ),
            Positioned(
              top: 248,
              left: 115,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPJ1 = !isPJ1;
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
                top: 270,
                left: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceOut,
                    height: isPJ1 ? 300 : 0,
                    width: isPJ1 ? 200 : 0,
                    color: isPJ1
                        ? Colors.white.withOpacity(0.5)
                        : Colors.transparent,
                  ),
                )),
            Positioned(
              top: 135,
              right: 318,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPJ2 = !isPJ2;
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
                top: 135,
                left: 665,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceOut,
                    height: isPJ2 ? 300 : 0,
                    width: isPJ2 ? 200 : 0,
                    color: isPJ2
                        ? Colors.white.withOpacity(0.5)
                        : Colors.transparent,
                  ),
                )),
            Positioned(
              top: 378,
              right: 77,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPJ3 = !isPJ3;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
                top: 408,
                right: 110,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceOut,
                    height: isPJ3 ? 300 : 0,
                    width: isPJ3 ? 200 : 0,
                    color: isPJ3
                        ? Colors.white.withOpacity(0.5)
                        : Colors.transparent,
                  ),
                )),
          ]),
        ),
      ]),
    ));
  }
}
