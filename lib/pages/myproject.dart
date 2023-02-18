import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devaldaporto/pages/project_pages/project_Electro.dart';
import 'package:devaldaporto/pages/project_pages/project_UI.dart';
import 'package:devaldaporto/pages/project_pages/project_mechatronic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

var MQwidth, MQsize, MQheight;
bool isRotate = false;
bool isPJ1 = false;
bool isPJ2 = false;
bool isPJ3 = false;

bool st1 = false;
bool st2 = false;
bool st3 = false;
bool st4 = false;
bool st5 = false;
bool st6 = false;
bool st7 = false;
bool st8 = false;
bool st9 = false;
bool st10 = false;

class MyProject extends StatefulWidget {
  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
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
          isPJ1 = false;
          isPJ2 = false;
          isPJ3 = false;
          isRotate = !isRotate;
        });
      },
      child: SizedBox(
        width: MQwidth,
        height: MQheight,
        child: LayoutBuilder(builder: (_, constraints) {
          final LBW = constraints.biggest.width;
          final LBH = constraints.biggest.height;
          return InteractiveViewer(
            maxScale: 5,
            constrained: false,
            child: Stack(children: [
              // BACKGROUND
              SizedBox(
                  height: MQheight,
                  width: 1000,
                  child: const RiveAnimation.asset(
                    fit: BoxFit.cover,
                    "assets/RiveAssets/Orbit.riv",
                    artboard: "Space Scene Demo",
                    // onInit:
                  )),
              // ARROW POINTER
              const Positioned(
                bottom: 190,
                left: 50,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: RiveAnimation.asset(
                        fit: BoxFit.cover,
                        "assets/RiveAssets/Arrow.riv",
                        artboard: "menu_to_left_arrow",
                        // onInit:
                      )),
                ),
              ),
              // TITLE
              Positioned(
                top: LBH * 0.4,
                left: LBW * 0.8,
                child: Column(children: [
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: DefaultTextStyle(
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.orbitron(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 500),
                          displayFullTextOnTap: true,
                          repeatForever: true,
                          animatedTexts: [
                            WavyAnimatedText('WELCOME TO'),
                            WavyAnimatedText('MY PROJECT !'),
                            WavyAnimatedText('Try to'),
                            WavyAnimatedText('Look Around !'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: DefaultTextStyle(
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.orbitron(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 247, 247, 247),
                          fontWeight: FontWeight.w500),
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 5000),
                          displayFullTextOnTap: true,
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                '*Tips : the start are clickable!  '),
                            TypewriterAnimatedText(
                                '*Tips : you can drag and pinch to zoom'),
                            TypewriterAnimatedText(
                                '*Tips : not all the star is true '),
                            TypewriterAnimatedText(
                                '*Tips : you can swipe to right on the project tab'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              // containerTrigger 1
              Positioned(
                top: LBH * 0.28,
                left: LBW * 0.28,
                child: GestureDetector(
                  onTap: () {
                    print("LBH $LBH\nLBW $LBW");

                    setState(() {
                      isPJ1 = !isPJ1;
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
                  top: LBH * 0.31,
                  left: LBW * 0.33,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.bounceOut,
                        height: isPJ1 ? 300 : 0,
                        width: isPJ1 ? 200 : 0,
                        color: isPJ1
                            ? const Color.fromARGB(240, 255, 255, 255)
                            : Colors.transparent,
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 3),
                          switchInCurve: Curves.decelerate,
                          reverseDuration: const Duration(milliseconds: 100),
                          child: isPJ1
                              ? const ProjMecha(
                                  // key: ValueKey(1),
                                  )
                              : const SizedBox(
                                  // key: ValueKey(2),
                                  ),
                        )),
                  )),
              // containerTrigger 2
              Positioned(
                top: LBH * 0.14,
                right: LBW * 0.8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPJ2 = !isPJ2;
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
                  top: LBH * 0.18,
                  right: LBW * 0.85,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      height: isPJ2 ? 300 : 0,
                      width: isPJ2 ? 200 : 0,
                      color: isPJ2
                          ? const Color.fromARGB(240, 255, 255, 255)
                          : Colors.transparent,
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 3),
                        switchInCurve: Curves.decelerate,
                        reverseDuration: const Duration(milliseconds: 100),
                        child: isPJ2
                            ? const projUX(
                                // key: ValueKey(1),
                                )
                            : const SizedBox(
                                // key: ValueKey(2),
                                ),
                      ),
                    ),
                  )),
              // containerTrigger 3
              Positioned(
                top: LBH * 0.42,
                right: LBW * 0.18,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPJ3 = !isPJ3;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                  top: LBH * 0.48,
                  right: LBW * 0.3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      height: isPJ3 ? 300 : 0,
                      width: isPJ3 ? 200 : 0,
                      color: isPJ3
                          ? const Color.fromARGB(240, 255, 255, 255)
                          : Colors.transparent,
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 3),
                        switchInCurve: Curves.decelerate,
                        reverseDuration: const Duration(milliseconds: 100),
                        child: isPJ3
                            ? const projElectro(
                                // key: ValueKey(1),
                                )
                            : const SizedBox(
                                // key: ValueKey(2),
                                ),
                      ),
                    ),
                  )),
//========================================== Star ============================================================
              // star1
              Positioned(
                top: LBH * 0.3,
                right: LBW * 0.45,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st1 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st1 = false;
                      });
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
                  top: LBH * 0.3,
                  right: LBW * 0.45,
                  child: AnimatedOpacity(
                    opacity: st1 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "Not this :D",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              //star2
              Positioned(
                top: LBH * 0.05,
                left: LBW * 0.18,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st2 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st2 = false;
                      });
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
                  top: LBH * 0.1,
                  left: LBW * 0.18,
                  child: AnimatedOpacity(
                    opacity: st2 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "Nooope",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star3
              Positioned(
                top: LBH * 0.14,
                right: LBW * 0.15,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st3 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st3 = false;
                      });
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
                  top: LBH * 0.2,
                  right: LBW * 0.15,
                  child: AnimatedOpacity(
                    opacity: st3 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "try again",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star4
              Positioned(
                bottom: LBH * 0.11,
                right: LBW * 0.74,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st4 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st4 = false;
                      });
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
                  bottom: LBH * 0.18,
                  right: LBW * 0.7,
                  child: AnimatedOpacity(
                    opacity: st4 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "far away :p",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star5
              Positioned(
                bottom: LBH * 0.15,
                right: LBW * 0.18,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st5 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st5 = false;
                      });
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
                  bottom: LBH * 0.20,
                  right: LBW * 0.18,
                  child: AnimatedOpacity(
                    opacity: st5 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "maybe another star",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star 6
              Positioned(
                bottom: LBH * 0.11,
                left: LBW * 0.65,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st6 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st6 = false;
                      });
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
                  bottom: LBH * 0.18,
                  left: LBW * 0.6,
                  child: AnimatedOpacity(
                    opacity: st6 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "wrong star",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star7
              Positioned(
                bottom: LBH * 0.25,
                left: LBW * 0.45,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st7 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st7 = false;
                      });
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
                  bottom: LBH * 0.35,
                  left: LBW * 0.4,
                  child: AnimatedOpacity(
                    opacity: st7 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "try any further",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star8
              Positioned(
                top: LBH * 0.36,
                left: LBW * 0.18,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st8 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st8 = false;
                      });
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
                  top: LBH * 0.4,
                  left: LBW * 0.23,
                  child: AnimatedOpacity(
                    opacity: st8 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "don't give up",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star*9
              Positioned(
                top: LBH * 0.05,
                left: LBW * 0.86,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st10 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st10 = false;
                      });
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
                  top: LBH * 0.1,
                  left: LBW * 0.8,
                  child: AnimatedOpacity(
                    opacity: st10 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "Too High XD",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
              // star10
              Positioned(
                top: LBH * 0.47,
                left: LBW * 0.05,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st10 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st10 = false;
                      });
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
                  top: LBH * 0.55,
                  left: LBW * 0.1,
                  child: AnimatedOpacity(
                    opacity: st10 ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Container(
                      // color: Colors.transparent,
                      child: Text(
                        "are you sure ?",
                        style: GoogleFonts.aboreto(
                            color: Colors.redAccent, fontSize: 20),
                      ),
                    ),
                  )),
            ]),
          );
        }),
      ),
    ));
  }
}
