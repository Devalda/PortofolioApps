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
                  Get.toNamed(RouteName.welcome);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              top: 135,
              right: 318,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.welcome);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              top: 378,
              right: 77,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.welcome);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ]),
        ),
      ]),
    ));
  }
}
