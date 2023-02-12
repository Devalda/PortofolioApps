import 'dart:ui';
import 'package:devaldaporto/dialogs/TNC_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dialogs/policy_dialog.dart';

// SharedPreferences? userPref;

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

  bool isJudul_01 = false;
  bool isJudul_02 = false;
  bool isJudul_03 = false;
  bool isJudul_04 = false;
  bool isJudul_05 = false;
  bool isUSERAGREEDTNC = false;

  Future init() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    bool? agreement = userPref.getBool('agreement');
    if (agreement == null) return;
    setState(() => isUSERAGREEDTNC = agreement);
    print(agreement);
  }

  // ignore: non_constant_identifier_names
  Future DialogTNCandPNP() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 60, 4, 58),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MQheight;
                  var width = MQwidth;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MQheight * 0.4,
                      color: Colors.black,
                      // height: ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Before we Continue..',
                              style: GoogleFonts.orbitron(
                                  fontSize: 20,
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Text(
                              'first "user" must Read to the ( Terms & Condition ) and ( Privacy Policy ) that have been provided below , and Agreed to it if "user" want to continue ',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.orbitron(
                                  fontSize: 15,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return TermDialog(
                                                mdFileName:
                                                    'TermsNCondition.md');
                                          });
                                    },
                                    child: Text(
                                      'Terms & Condition',
                                      style: GoogleFonts.orbitron(fontSize: 10),
                                    )),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PolicyDialog(
                                              mdFileName: 'PrivacyNPolicy.md');
                                        });
                                  },
                                  child: Text(
                                    'Privacy Policy',
                                    style: GoogleFonts.orbitron(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "i agreed and proceed to continue",
                            style: GoogleFonts.orbitron(
                                fontSize: 10, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    // ignore: prefer_const_constructors
                                    style: ButtonStyle(
                                        enableFeedback: true,
                                        backgroundColor:
                                            const MaterialStatePropertyAll<
                                                    Color>(
                                                Colors.deepPurpleAccent)),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text("cancel")),
                                const SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        enableFeedback: true,
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.deepPurpleAccent)),
                                    onPressed: () {
                                      // userPref?.setBool('agreement', true);
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: const Text("agree"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
  }

  legitimateUser(String judul) {
    if (isUSERAGREEDTNC == false) {
      DialogTNCandPNP();
    }
    if (isUSERAGREEDTNC == true) {
      if (judul == "isJudul_01") {
        setState(() {
          isJudul_01 = !isJudul_01;
        });
      }
      if (judul == "isJudul_02") {
        setState(() {
          isJudul_02 = !isJudul_02;
        });
      }
      if (judul == "isJudul_03") {
        setState(() {
          isJudul_03 = !isJudul_03;
        });
      }
      if (judul == "isJudul_04") {
        setState(() {
          isJudul_04 = !isJudul_04;
        });
      }
      if (judul == "isJudul_05") {
        setState(() {
          isJudul_05 = !isJudul_05;
        });
      }
    }
  }

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

            // text Big
            AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn,
              bottom: isActiveUp ? 550 : MQheight * 0.35,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: isActiveUp ? 0 : 1,
                curve: Curves.easeInOutSine,
                child: Container(
                  alignment: Alignment.center,
                  width: MQwidth,
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255))
                              : GoogleFonts.londrinaSketch(
                                  fontSize: 60,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                          child: Text(PersonName)),
                      Text(
                        DescBio,
                        style: GoogleFonts.orbitron(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      )
                    ]),
                  ),
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
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: isActiveUp ? MQheight * 0.65 : MQheight * 0.25,
                      width: MQwidth,
                      color: isActiveUp
                          ? const Color.fromARGB(240, 62, 10, 94)
                          : const Color.fromARGB(191, 59, 30, 108),
                      duration: const Duration(milliseconds: 800),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: MQwidth * 0.85,
                                  child: ListView(
                                      // physics: const BouncingScrollPhysics(),
                                      children: [
                                        Column(
                                          children: [
                                            // JUDUL 1
                                            GestureDetector(
                                              onTap: () {
                                                legitimateUser("isJudul_01");
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(
                                                                20)),
                                                child: Container(
                                                  height: 60,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  width: MQwidth * 0.85,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      "About Me",
                                                      style: GoogleFonts.acme(
                                                          fontSize: 20,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              112, 4, 126)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // ISI JUDUL 1
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isJudul_01 = !isJudul_01;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                duration: const Duration(
                                                    milliseconds: 800),
                                                color: const Color.fromARGB(
                                                    110, 255, 255, 255),
                                                height: isJudul_01 ? 370 : 0,
                                                child: Text(
                                                  "Hi , Im an Information System fresh graduate who loves all about technology i had Ebusiness major when im in university that learn database relational , making a website , and managing data structure. i had a few experience like backend developer using django when im in internship program, mechatronic developer in internship program , ever developed my personal project application from (ui,wire frame,business process,frontend using flutter,firebase)",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            // JUDUL 2
                                            GestureDetector(
                                              onTap: () {
                                                legitimateUser("isJudul_02");
                                              },
                                              child: Container(
                                                  height: 60,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  width: MQwidth * 0.85,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      "Vision",
                                                      style: GoogleFonts.acme(
                                                          fontSize: 20,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              112, 4, 126)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                            ),
                                            // ISI JUDUL 2
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isJudul_02 = !isJudul_02;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                color: const Color.fromARGB(
                                                    110, 255, 255, 255),
                                                height: isJudul_02 ? 370 : 0,
                                                child: Text(
                                                  "Committed to working as a collaborative and positive team member, striving to utilize my knowledge and expertise for optimal engineering results. Innovative Programmer and Internet Entrepreneur striving to make the world a more unified and connected place. Familiar and adept in working with engineering, industrial engineering, change management, and business transformation systems. A creative thinker, adept in software development and working with various data structures.",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                legitimateUser("isJudul_03");
                                              },
                                              child: Container(
                                                  height: 60,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  width: MQwidth * 0.85,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      "Biodata",
                                                      style: GoogleFonts.acme(
                                                          fontSize: 20,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              112, 4, 126)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                            ),
                                            // ISI JUDUL 3
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isJudul_03 = !isJudul_03;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                color: Colors.redAccent,
                                                height: isJudul_03 ? 200 : 0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // text MINI
            Container(
              width: MQwidth,
              child: Stack(children: [
                AnimatedPositioned(
                  top: isActiveUp ? MQheight * 0.1 : MQheight * 0.07,
                  left: isActiveUp ? 40 : MQwidth * 0.15,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: isActiveUp
                        ? const BorderRadius.all(Radius.circular(15))
                        : const BorderRadius.all(Radius.circular(30)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: isActiveUp ? MQwidth * 0.25 : MQwidth * 0.7,
                      height: isActiveUp ? 140 : MQheight * 0.45,
                      child: ClipRRect(
                        borderRadius: isActiveUp
                            ? const BorderRadius.all(Radius.circular(15))
                            : const BorderRadius.all(Radius.circular(30)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isActiveUp = !isActiveUp;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/foto/fotoProfile.jpg'))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // text MINI
                Positioned(
                  top: MQheight * 0.15,
                  right: 40,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: isActiveUp ? 1.0 : 0,
                    curve: Curves.easeInOutSine,
                    child: Column(children: [
                      Text(
                        PersonName,
                        style: GoogleFonts.londrinaSolid(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Text(
                        DescBio,
                        style: GoogleFonts.orbitron(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      )
                    ]),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
