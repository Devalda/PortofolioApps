import 'package:flutter/material.dart';
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
      child: SizedBox(
        width: MQwidth,
        height: MQheight,
        child: Expanded(
          child: InteractiveViewer(
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
                        fontSize: 15,
                        color: Color.fromARGB(255, 249, 249, 249)),
                  ),
                ]),
              ),
              // containerTrigger 1
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
                    height: 50,
                    width: 50,
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
                          ? Color.fromARGB(219, 255, 255, 255)
                          : Colors.transparent,
                    ),
                  )),
              // containerTrigger 2
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
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                  top: 140,
                  right: 342,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      height: isPJ2 ? 300 : 0,
                      width: isPJ2 ? 200 : 0,
                      color: isPJ2
                          ? Color.fromARGB(199, 255, 255, 255)
                          : Colors.transparent,
                    ),
                  )),
              // containerTrigger 3
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
                    height: 80,
                    width: 80,
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
                          ? Color.fromARGB(219, 255, 255, 255)
                          : Colors.transparent,
                    ),
                  )),
              // star1
              Positioned(
                top: 260,
                right: 182,
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
                  top: 270,
                  right: 198,
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
                top: 260,
                right: 182,
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
                  top: 270,
                  right: 198,
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
                top: 130,
                right: 78,
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
                  top: 140,
                  right: 88,
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
                bottom: 100,
                right: 300,
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
                  bottom: 120,
                  right: 300,
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
                bottom: 140,
                right: 85,
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
                  bottom: 160,
                  right: 85,
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
                bottom: 110,
                left: 270,
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
                  bottom: 130,
                  left: 200,
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
                bottom: 235,
                left: 190,
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
                  bottom: 255,
                  left: 120,
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
                top: 320,
                left: 80,
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
                  top: 340,
                  left: 80,
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
                top: 60,
                left: 350,
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
                  top: 80,
                  left: 350,
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
                top: 415,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      st9 = true;
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        st10 = false;
                      });
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                  top: 425,
                  left: 40,
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
          ),
        ),
      ),
    ));
  }
}
