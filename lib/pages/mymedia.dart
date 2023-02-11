import 'dart:ui';

import 'package:animated_gradient/animated_gradient.dart';
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
  bool isInstagram = false;
  bool isLinkedin = false;
  bool isFacebook = false;
  bool isWhatsapp = false;

  List<Color> linkedinGradient = [
    const Color(0xFF86888A),
    const Color(0xFF0077B5),
    const Color(0xFF00A0DC),
    const Color(0xFFCACCCE),
  ];

  List<Color> whatsappGradien = [
    const Color.fromARGB(255, 30, 190, 166),
    const Color.fromARGB(255, 0, 230, 119),
    const Color.fromARGB(255, 229, 255, 204),
  ];

  List<Color> instagramColor = [
    const Color.fromARGB(255, 64, 92, 230),
    const Color.fromARGB(255, 90, 81, 216),
    const Color.fromARGB(255, 131, 58, 180),
    const Color.fromARGB(255, 193, 53, 132),
    const Color.fromARGB(255, 225, 48, 107),
    const Color.fromARGB(255, 253, 29, 29),
    const Color.fromARGB(255, 245, 97, 64),
    const Color.fromARGB(255, 247, 119, 55),
    const Color.fromARGB(255, 252, 176, 69),
    const Color.fromARGB(255, 255, 219, 128),
  ];

  List<Color> facebookGradient = [
    const Color.fromARGB(255, 73, 102, 164),
    const Color.fromARGB(255, 58, 87, 149),
    const Color.fromARGB(255, 43, 72, 134),
    const Color.fromARGB(255, 28, 57, 119),
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

    List<Color> plainColor = [
      const Color.fromARGB(50, 255, 255, 255),
      const Color.fromARGB(80, 255, 255, 255)
    ];

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
                            color:
                                Colors.white.withOpacity(0.3).withOpacity(0.05),
                            width: 3.5),
                        gradient: FG.LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.3).withOpacity(0.25),
                              Colors.white.withOpacity(0.3).withOpacity(0.20),
                              Colors.white.withOpacity(0.3).withOpacity(0.15),
                              Colors.white.withOpacity(0.3).withOpacity(0.10),
                            ])),
                    //input data here
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            setState(() {
                              isInstagram = true;
                            });
                            Future.delayed(const Duration(milliseconds: 800),
                                () {
                              launch(
                                  "https://instagram.com/briandevalda?igshid=YmMyMTA2M2Y=");
                              setState(() {
                                isInstagram = false;
                              });
                            });
                            //
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MQwidth * 0.6,
                              decoration: BoxDecoration(
                                  gradient: FG.LinearGradient(
                                      colors: isInstagram
                                          ? instagramColor
                                          : plainColor)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/icon/instagram.png'),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.rectangle),
                                    ),
                                  ),
                                  // spacer box
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      ColorizeAnimatedText('INSTAGRAM',
                                          textStyle: GoogleFonts.orbitron(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          colors: instagramColor,
                                          speed:
                                              const Duration(milliseconds: 800))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            setState(() {
                              isFacebook = true;
                            });
                            Future.delayed(const Duration(milliseconds: 800),
                                () {
                              launch(
                                  "https://www.facebook.com/brian.devalda?mibextid=LQQJ4d");
                              setState(() {
                                isFacebook = false;
                              });
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MQwidth * 0.6,
                              decoration: BoxDecoration(
                                  gradient: FG.LinearGradient(
                                      colors: isFacebook
                                          ? facebookGradient
                                          : plainColor)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/icon/facebook.png'),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.rectangle),
                                    ),
                                  ),
                                  // SPACER
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      ColorizeAnimatedText('FACEBOOK',
                                          textStyle: GoogleFonts.orbitron(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          colors: facebookGradient,
                                          speed:
                                              const Duration(milliseconds: 800))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            setState(() {
                              isLinkedin = true;
                            });
                            Future.delayed(const Duration(milliseconds: 800),
                                () {
                              launch(
                                  "https://www.linkedin.com/in/brian-devalda-03a4321b8");
                              setState(() {
                                isLinkedin = false;
                              });
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MQwidth * 0.6,
                              decoration: BoxDecoration(
                                  gradient: FG.LinearGradient(
                                      colors: isLinkedin
                                          ? linkedinGradient
                                          : plainColor)),
                              child: Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icon/linkedin.png'),
                                            fit: BoxFit.fill),
                                        shape: BoxShape.rectangle),
                                  ),
                                ),
                                // SPACER
                                const SizedBox(
                                  width: 20,
                                ),
                                AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    ColorizeAnimatedText('LINKEDIN',
                                        textStyle: GoogleFonts.orbitron(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        colors: linkedinGradient,
                                        speed:
                                            const Duration(milliseconds: 800))
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isWhatsapp = true;
                            });
                            // ignore: deprecated_member_use
                            Future.delayed(Duration(milliseconds: 800), () {
                              launch("https://whatsapp.com/");
                              setState(() {
                                isWhatsapp = false;
                              });
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MQwidth * 0.6,
                              decoration: BoxDecoration(
                                gradient: FG.LinearGradient(
                                    colors: isWhatsapp
                                        ? whatsappGradien
                                        : plainColor),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/icon/whatsapp.png'),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.rectangle),
                                    ),
                                  ),
                                  // SPACER
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      ColorizeAnimatedText('WHATSAPP',
                                          textStyle: GoogleFonts.orbitron(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          colors: whatsappGradien,
                                          speed:
                                              const Duration(milliseconds: 800))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                  height: 255,
                  width: 255,
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
