import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devaldaporto/auth/agreementPops.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as FG;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../beautify/Colors_pallet.dart';

var MQwidth, MQsize, MQheight;
bool isAstro = false;
bool riseUp = true;

bool isInstagram = false;
bool isLinkedin = false;
bool isFacebook = false;
bool isWhatsapp = false;
bool isMail = false;
late bool isUSERAGREEDTNC;

class MyMedia extends StatefulWidget {
  @override
  State<MyMedia> createState() => _MyMediaState();

  saveOptions() async {
    isUSERAGREEDTNC = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('agreement', true);
  }
}

class _MyMediaState extends State<MyMedia> with SingleTickerProviderStateMixin {
  final AgreementPops apos = AgreementPops();

  _loadShareprefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUSERAGREEDTNC = prefs.getBool('agreement') ?? false;
    print(isUSERAGREEDTNC);
  }

  _showPops() {
    if (isUSERAGREEDTNC == false) {
      apos.DialogTNCandPNP(context, MQwidth, MQheight, true);
    }
  }

  late AnimationController _gradientController;
  @override
  void initState() {
    _loadShareprefData();
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
              SizedBox(
                height: MQheight * 0.25,
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
                            colors: gradientBackplateContainerFrosted)),
                    //input data here
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            if (isUSERAGREEDTNC == false) {
                              _showPops();
                            } else {
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
                            }

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
                            if (isUSERAGREEDTNC == false) {
                              _showPops();
                            } else {
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
                            }
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
                            if (isUSERAGREEDTNC == false) {
                              _showPops();
                            } else {
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
                            }
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
                            if (isUSERAGREEDTNC == false) {
                              _showPops();
                            } else {
                              setState(() {
                                isWhatsapp = true;
                              });
                              // ignore: deprecated_member_use
                              Future.delayed(const Duration(milliseconds: 800),
                                  () {
                                launch("https://whatsapp.com/");
                                setState(() {
                                  isWhatsapp = false;
                                });
                              });
                            }
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
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (isUSERAGREEDTNC == false) {
                                  _showPops();
                                } else {
                                  setState(() {
                                    isMail = true;
                                  });
                                  Future.delayed(const Duration(seconds: 10),
                                      () {
                                    setState(() {
                                      isMail = false;
                                    });
                                  });
                                }

                                // ignore: deprecated_member_use
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: MQwidth * 0.6,
                                  decoration: BoxDecoration(
                                    gradient: FG.LinearGradient(
                                        colors: isMail
                                            ? emailGradient
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
                                                      'assets/icon/mail.png'),
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
                                          ColorizeAnimatedText('EMAIL',
                                              textStyle: GoogleFonts.orbitron(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              colors: emailGradient,
                                              speed: const Duration(
                                                  milliseconds: 800))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMail = false;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AnimatedOpacity(
                                  duration:
                                      (const Duration(milliseconds: 1000)),
                                  opacity: isMail ? 1 : 0,
                                  child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: isMail ? MQwidth * 0.6 : 0,
                                      height: isMail ? MQheight * 0.085 : 0,
                                      decoration: BoxDecoration(
                                          gradient: FG.LinearGradient(
                                        colors: emailGradient,
                                      )),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "brian@devalda.site",
                                          style: GoogleFonts.orbitron(
                                              fontSize: 20,
                                              color: isMail
                                                  ? Colors.redAccent
                                                  : Colors.transparent,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )),
                                ),
                              ),
                            )
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
        // astronaut
        AnimatedPositioned(
          duration: const Duration(seconds: 5),
          bottom: isAstro ? 0 : MQheight * 0.7,
          right: isAstro ? 0 : MQwidth * 0.4,
          child: GestureDetector(
            onTap: () {
              if (isUSERAGREEDTNC == false) {
                _showPops();
              }

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
