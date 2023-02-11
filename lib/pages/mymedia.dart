import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as FG;
import 'package:url_launcher/url_launcher.dart';

const colorizeColors = [
  Color(0xFF2d1b46),
  Color(0xFF790f6a),
  Color(0xFFb93692),
  Color(0xFFe851c4),
  Color(0xFFb93692),
  Color(0xFF790f6a),
  Color(0xFF2d1b46),
  Color(0xFF790f6a),
];

class MyMedia extends StatefulWidget {
  @override
  State<MyMedia> createState() => _MyMediaState();
}

class _MyMediaState extends State<MyMedia> {
  var MQwidth, MQsize, MQheight;
  bool isAstro = false;
  bool riseUp = true;
  List effectbost = [
    [
      BoxShadow(
        color: const Color.fromARGB(255, 174, 166, 166)!,
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Color.fromARGB(255, 239, 238, 238),
        offset: Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
    ],
    [
      const BoxShadow(
        color: Color.fromARGB(255, 253, 227, 255),
        offset: Offset(4, 4),
        blurRadius: 0,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Color.fromARGB(255, 253, 227, 255),
        offset: Offset(-4, -4),
        blurRadius: 0,
        spreadRadius: 1,
      ),
    ]
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        isAstro = true;
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
      body: Stack(children: [
        // background
        RotatedBox(
          quarterTurns: 3,
          child: SizedBox(
            height: MQwidth,
            width: MQheight,
            child: const RiveAnimation.asset(
              fit: BoxFit.cover,
              "assets/RiveAssets/Cosmos.riv",
              artboard: "New Artboard",
              // onInit:
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 190,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(
                    width: MQwidth / 1.25,
                    height: MQheight * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.05), width: 3.5),
                        gradient: FG.LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.25),
                              Colors.white.withOpacity(0.20),
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.10),
                            ])),
                    //input data here
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            launch(
                                "https://otakudesu.asia/episode/teis-episode-19-sub-indo/");
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // astronaut
        AnimatedPositioned(
          duration: const Duration(seconds: 5),
          bottom: isAstro ? 0 : MQheight * 0.7,
          right: isAstro ? 0 : MQwidth * 0.4,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAstro = !isAstro;
              });
            },
            child: AnimatedRotation(
              duration: const Duration(seconds: 5),
              curve: Curves.elasticOut,
              turns: isAstro ? 0 : 1.5,
              child: const SizedBox(
                  height: 300,
                  width: 300,
                  child: RiveAnimation.asset(
                    fit: BoxFit.cover,
                    "assets/RiveAssets/Astronaut.riv",
                    // onInit:
                  )),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 65,
          child: Column(
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText('CONNECT ME',
                      textStyle: GoogleFonts.orbitron(
                          fontSize: 35, fontWeight: FontWeight.bold),
                      colors: colorizeColors,
                      speed: const Duration(milliseconds: 800))
                ],
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText('ON',
                      textStyle: GoogleFonts.orbitron(
                          fontSize: 40, fontWeight: FontWeight.bold),
                      colors: colorizeColors,
                      speed: const Duration(milliseconds: 4000))
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
