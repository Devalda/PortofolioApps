import 'dart:ui';
import 'package:devaldaporto/auth/agreementPops.dart';
import 'package:devaldaporto/dialogs/TNC_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/agreementPops.dart';
import '../dialogs/policy_dialog.dart';

// SharedPreferences? userPref;
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
bool? isUSERAGREEDTNC;

class Profile extends StatefulWidget {
  const Profile({super.key});
  saveOptionsProf() async {
    isUSERAGREEDTNC = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('agreement', true);
  }

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AgreementPops apos = AgreementPops();

  legitimateUser(String judul) {
    if (isUSERAGREEDTNC == false) {
      apos.DialogTNCandPNP(context, MQwidth, MQheight, false);
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

  _loadShareprefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUSERAGREEDTNC = prefs.getBool('agreement') ?? false;
    print(isUSERAGREEDTNC);
  }

  @override
  void initState() {
    _loadShareprefData();
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
                                                width: MQwidth * 0.85,
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
                                                height: isJudul_02 ? 390 : 0,
                                                width: MQwidth * 0.85,
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
                                                  isJudul_03 = !isJudul_04;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  color: const Color.fromARGB(
                                                      110, 255, 255, 255),
                                                  height: isJudul_03 ? 283 : 0,
                                                  width: MQwidth * 0.85,
                                                  child: Expanded(
                                                    child: Offstage(
                                                      offstage: !isJudul_03,
                                                      child: AnimatedOpacity(
                                                        opacity:
                                                            isJudul_03 ? 1 : 0,
                                                        duration:
                                                            const Duration(
                                                                seconds: 5),
                                                        curve: Curves.linear,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                isJudul_03 =
                                                                    !isJudul_03;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      MQwidth *
                                                                          0.8,
                                                                  height:
                                                                      MQheight *
                                                                          0.05,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "Name     : Brian Devalda",
                                                                        style: GoogleFonts.inter(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  width:
                                                                      MQwidth *
                                                                          0.8,
                                                                  height:
                                                                      MQheight *
                                                                          0.05,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(8),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "DOB        : Tangerang, 04/05/2000",
                                                                        style: GoogleFonts.inter(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.white),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  width:
                                                                      MQwidth *
                                                                          0.8,
                                                                  height:
                                                                      MQheight *
                                                                          0.05,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "Nationality : Indonesian",
                                                                        style: GoogleFonts.inter(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  width:
                                                                      MQwidth *
                                                                          0.8,
                                                                  height:
                                                                      MQheight *
                                                                          0.05,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "Residence : Tangerang,Banten",
                                                                        style: GoogleFonts.inter(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  width:
                                                                      MQwidth *
                                                                          0.8,
                                                                  height:
                                                                      MQheight *
                                                                          0.05,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "Job       : Front end Developer",
                                                                        style: GoogleFonts.inter(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            // JUDUL 4
                                            GestureDetector(
                                              onTap: () {
                                                legitimateUser("isJudul_04");
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
                                                      "Education",
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
                                            // ISI JUDUL 4
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isJudul_04 = !isJudul_04;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                color: const Color.fromARGB(
                                                    110, 255, 255, 255),
                                                height: isJudul_04 ? 450 : 0,
                                                width: MQwidth * 0.85,
                                                child: Expanded(
                                                  child: AnimatedOpacity(
                                                    opacity: isJudul_04 ? 1 : 0,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "INFORMATION SYSTEM",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "BINUS UNIVERSITY JAKARTA",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "2018 - 2022",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                          height: 40,
                                                        ),
                                                        Text(
                                                          "EVENTS ACTIVITIES",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          " - steering Committee at DvSos2019 - KMBD BINUS(Jakrta - 2019)",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          " - HEAD Division Art and Documentation at Welcome Party KMBD(Jakarta - 2019)",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          " - Volunteer vesakh at Borobudur temple(Magelang - 2019)",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                        Text(
                                                          "SKILLS",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "- UI/UX Developer",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "- Video Editor",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "- BackEnd Engineer",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "- Ilustrator",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "- Mechatronic Engineer",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // JUDUL 5
                                            GestureDetector(
                                              onTap: () {
                                                legitimateUser("isJudul_05");
                                              },
                                              child: AnimatedContainer(
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  height: 60,
                                                  width: MQwidth * 0.85,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft: isJudul_05
                                                            ? const Radius
                                                                .circular(0)
                                                            : const Radius
                                                                .circular(20),
                                                        bottomRight: isJudul_05
                                                            ? const Radius
                                                                .circular(0)
                                                            : const Radius
                                                                .circular(20)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      "Employement History",
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
                                            // ISI JUDUL 5
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isJudul_05 = !isJudul_05;
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      110, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: isJudul_05
                                                        ? const Radius.circular(
                                                            20)
                                                        : const Radius.circular(
                                                            0),
                                                    bottomRight: isJudul_05
                                                        ? const Radius.circular(
                                                            20)
                                                        : const Radius.circular(
                                                            0),
                                                    topLeft: isJudul_05
                                                        ? const Radius.circular(
                                                            0)
                                                        : const Radius.circular(
                                                            20),
                                                    topRight: isJudul_05
                                                        ? const Radius.circular(
                                                            0)
                                                        : const Radius.circular(
                                                            20),
                                                  ),
                                                ),
                                                height: isJudul_05 ? 700 : 0,
                                                width: MQwidth * 0.85,
                                                child: AnimatedOpacity(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  opacity: isJudul_05 ? 1 : 0,
                                                  curve: Curves.fastOutSlowIn,
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Text(
                                                        "Application Developer - Pharos",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "work as Back End developer that create few functional method to generate promotion voucher using API to the specific marketplace that connect apps system to the apps that being develop, and pull sample data using Selenium for specific development. The apps development got manage by using Frame Work Django that using python language as Back End and Google Cloud Server as serving the staging and production  server.",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Text(
                                                        "Mechatronic Enginner - Pharos",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        "Develop the automation system for drug manufacturing , underdevelopment on system for quality control about filling and capping machine for the syrup bottle and laxative injection drugs packaging, using camera vision as input and Open Vision as Processing software.In Collaboration for storage automation project  for managing storage at drug factory , the one tha im in developing is automating the forklift using (Arduino) as the mechanic brain and (Esp) as the bridge connection between unit and the main brain computer, using line follower method as the main route direction , and developed the safety system using a few sensor , and make the human friendly control using wireless controller that can operate manually too.",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
